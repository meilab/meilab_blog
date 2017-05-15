module Views.PostDetail exposing (postdetailView)

import Html exposing (..)
import Html.Attributes exposing (type_, value, class, for, id, placeholder)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Views.Map exposing (mapView)


postdetailView : Model -> String -> Html Msg
postdetailView model slug =
    div []
        [ mapView model ]
