module Views.ProjectList exposing (projectlistView)

import Html exposing (..)
import Html.Attributes exposing (type_, value, class, for, id, placeholder)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)


projectlistView : Model -> Html Msg
projectlistView model =
    div [] [ text "Rent View" ]
