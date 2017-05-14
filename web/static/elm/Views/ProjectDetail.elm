module Views.PeojectDetail exposing (projectdetailView)

import Html exposing (..)
import Html.Attributes exposing (type_, value, class, for, id, placeholder)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Views.Map exposing (mapView)


projectdetailView : Model -> String -> Html Msg
projectdetailView model slug =
    div []
        [ mapView model ]
