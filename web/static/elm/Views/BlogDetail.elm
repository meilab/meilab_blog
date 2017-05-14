module Views.BlogDetail exposing (blogdetailView)

import Html exposing (..)
import Html.Attributes exposing (type_, value, class, for, id, placeholder)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Views.Map exposing (mapView)


blogdetailView : Model -> String -> Html Msg
blogdetailView model slug =
    div []
        [ mapView model ]
