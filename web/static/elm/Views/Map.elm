module Views.Map exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Json.Decode as JD exposing (..)


mapView : Model -> Html Msg
mapView model =
    div []
        [ div []
            [ label [] [ text "Latitude" ]
            , input
                [ type_ "range"
                , attribute "min" "-1800000"
                , attribute "max" "1800000"
                , defaultValue (toString model.latitude)
                , onChange SetLatitude
                ]
                []
            , span [] [ text (toString model.latitude) ]
            ]
        , div []
            [ label [] [ text "Longitude" ]
            , input
                [ type_ "range"
                , attribute "min" "-1800000"
                , attribute "max" "1800000"
                , defaultValue (toString model.longitude)
                , onChange SetLongitude
                ]
                []
            , span [] [ text (toString model.longitude) ]
            ]
        , img
            [ class "elm-logo"
            , src "http://package.elm-lang.org/assets/elm_logo.svg"
            ]
            []
        , googleMap
            [ attribute "latitude" (toString model.latitude)
            , attribute "longitude" (toString model.longitude)
            , attribute "drag-events" "true"
            , recordLatLongOnDrag
            ]
            []
        ]



-- <google-map fit-to-marker api-key="AIzaSyD3E1D9b-Z7ekrT3tbhl_dy8DCXuIuDDRc">
--   <google-map-marker latitude="37.78" longitude="-122.4" draggable="true"></google-map-marker>
-- </google-map>


googleMap : List (Attribute a) -> List (Html a) -> Html a
googleMap =
    Html.node "google-map"


recordLatLongOnDrag : Attribute Msg
recordLatLongOnDrag =
    Html.Events.on "google-map-drag" <|
        map2 SetLatLong
            (at [ "target", "latitude" ] float)
            (at [ "target", "longitude" ] float)


onChange : (Float -> Msg) -> Attribute Msg
onChange toMsg =
    JD.string
        |> JD.andThen decodeLatLong
        |> JD.at [ "target", "value" ]
        |> JD.map toMsg
        |> Html.Events.on "change"


decodeLatLong : String -> Decoder Float
decodeLatLong str =
    case JD.decodeString JD.float str of
        Ok num ->
            JD.succeed (num / 10000)

        Err err ->
            JD.fail err
