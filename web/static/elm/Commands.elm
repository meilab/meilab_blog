module Commands exposing (authRequest)

import Http exposing (..)
import Json.Decode as JD exposing (at)
import Json.Encode as JE
import Json.Decode.Pipeline exposing (decode, required, optional)
import Messages exposing (..)
import Types exposing (AuthResponse)
import Helpers exposing (tokenHeader)
import Maybe


authRequest : Maybe String -> String -> String -> String -> Cmd Msg
authRequest token api_url username password =
    Http.request
        { method = "POST"
        , headers = [ (tokenHeader token) ]
        , url = authRequestUrl api_url
        , body = authBody username password
        , expect = authResponseExpect
        , timeout = Nothing
        , withCredentials = False
        }
        |> Http.send OnAuthCmdResponse


authRequestUrl : String -> String
authRequestUrl api_url =
    api_url ++ "/auth"



-- CMD encoder


authBody : String -> String -> Body
authBody username password =
    jsonBody
        (JE.object
            [ ( "username", JE.string username )
            , ( "password", JE.string password )
            ]
        )



-- CMD response DECODERS


authResponseExpect : Expect AuthResponse
authResponseExpect =
    expectJson collectionDecoder


collectionDecoder : JD.Decoder AuthResponse
collectionDecoder =
    decode AuthResponse
        |> required "code" JD.string
        |> required "token" JD.string
