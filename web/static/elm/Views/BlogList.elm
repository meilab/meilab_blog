module Views.BlogList exposing (bloglistView)

import Html exposing (..)
import Html.Attributes exposing (type_, value, class, for, id, placeholder)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)


bloglistView : Model -> Html Msg
bloglistView model =
    div [] [ text "Rent View" ]
