module Views.PostList exposing (postlistView)

import Html exposing (Html, section, form, img, button, i, h1, h2, h3, h4, p, span, a, div, ul, li, text, nav, header, fieldset, label, input)
import Html.Attributes exposing (style, href, type_, value, class, for, id, placeholder)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)
import ViewHelpers exposing (navContainer, navigationOnClick, contactLink)
import Routing exposing (Route(..), urlFor, routingItemPost)
import Markdown exposing (toHtml)
import Types exposing (PostMetaInfo)
import Styles.SharedStyles exposing (..)
import Html.CssHelpers exposing (withNamespace)


{ id, class, classList } =
    withNamespace "meilab"


postlistView : Model -> Html Msg
postlistView model =
    div [ class [ BlogLayout ] ]
        [ sideBar model
        , content model
        ]


sideBar : Model -> Html Msg
sideBar model =
    div [ class [ BlogSideBarWrapper ] ]
        [ div [ class [ BlogSideBarMenu ] ]
            [ h1 [ class [ BrandTitle ] ] [ text "Meilab Post" ]
            , h2 [ class [ BrandTagline ] ] [ text "Elixir Phoenix Elm ReactNative C MQTT Socket" ]
            , navContainer model
            ]
        ]


content : Model -> Html Msg
content model =
    div [ class [ BlogContent ] ]
        [ div []
            [ posts model
            , footer
            ]
        ]


posts : Model -> Html Msg
posts model =
    div [ class [ Posts ] ]
        (model.postList
            |> List.map post
        )


post : PostMetaInfo -> Html Msg
post postMetaInfo =
    section [ class [ PostContainer ] ]
        [ header [ class [ PostHeader ] ]
            [ img [] []
            , h2 [ class [ PostTitle ] ] [ text postMetaInfo.title ]
            , p [ class [ PostMeta ] ]
                [ text "By"
                , a [ class [ PostAuthor ] ] [ text postMetaInfo.author ]
                , text "Under"
                , a [ class [ PostCategory ] ] [ text "Pure" ]
                , a [ class [ PostCategory ] ] [ text "CSS" ]
                ]
            ]
        , div [ class [ PostDescription ] ]
            [ toHtml [] postMetaInfo.description
            ]
        ]


footer : Html Msg
footer =
    div
        [ class [ Footer ]
        ]
        [ ul [ class [ MenuList ] ]
            [ contactLink "http://pureccss.io" "fa fa-home" ""
            , contactLink "http://github.com/meilab/" "fa fa-github-alt" ""
            , contactLink "http://github.com/yahoo/pure" "fa fa-weibo" ""
            , contactLink "http://github.com/yahoo/pure" "fa fa-wechat" ""
            ]
        ]



-- navContainer : Model -> Html Msg
-- navContainer model =
--     nav [ class "nav" ]
--         [ ul [ class "nav-list" ]
--             (List.map (navItem model) (routingItemPost model.url.src_url))
--         ]
-- navItem : Model -> ( String, String, Route, String ) -> Html Msg
-- navItem model ( title, iconClass, route, slug ) =
--     li [ class "nav-item" ]
--         [ a
--             [ href slug
--             , navigationOnClick (route |> (urlFor model.url.src_url) |> NewUrl)
--             , class "pure-button"
--             ]
--             [ text title
--             ]
--         ]
