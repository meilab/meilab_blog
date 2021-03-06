module Helpers exposing (..)

import Task
import Http exposing (..)


{-| Lift any value of type `msg` to a `Cmd msg`.
-}
cmd : msg -> Cmd msg
cmd msg =
    Task.perform (always msg) (Task.succeed msg)


tokenHeader : Maybe String -> Header
tokenHeader token =
    case token of
        Just tokenValue ->
            Http.header "Authorization" tokenValue

        Nothing ->
            Http.header "Authorization" "No token"
