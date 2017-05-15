module Commands exposing (authRequest, getBlogList)

import Http exposing (..)
import Json.Decode as JD exposing (at)
import Json.Encode as JE
import Json.Decode.Pipeline exposing (decode, required, optional)
import Messages exposing (..)
import Types exposing (AuthResponse, BlogList, BlogMetaInfo)
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


getBlogList : Maybe String -> String -> Cmd Msg
getBlogList token api_url =
    Http.request
        { method = "GET"
        , headers = [ (tokenHeader token) ]
        , url = getBlogListUrl api_url
        , body = emptyBody
        , expect = bloglistExpect
        , timeout = Nothing
        , withCredentials = False
        }
        |> Http.send OnBlogListResponse


getBlogListUrl : String -> String
getBlogListUrl api_url =
    api_url ++ "/posts"



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


bloglistExpect : Expect BlogList
bloglistExpect =
    expectJson bloglistDecoder


bloglistDecoder : JD.Decoder BlogList
bloglistDecoder =
    JD.list blogMetaInfoDecoder


blogMetaInfoDecoder : JD.Decoder BlogMetaInfo
blogMetaInfoDecoder =
    decode BlogMetaInfo
        |> required "slug" JD.string
        |> required "author" JD.string
        |> required "title" JD.string
        |> required "description" JD.string
        |> required "date" JD.string
        |> required "tags" (JD.list JD.string)
        |> required "headerimg" JD.string
        |> required "pinned" JD.bool
        |> required "published" JD.bool
