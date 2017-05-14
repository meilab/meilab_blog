module Views.Overview exposing (overview)

import Html exposing (..)
import Html.Attributes exposing (type_, value, class, for, id, placeholder)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Views.Map exposing (mapView)


overview : Model -> Html Msg
overview model =
    div []
        [ mapView model ]
