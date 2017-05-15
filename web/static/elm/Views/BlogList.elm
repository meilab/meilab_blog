module Views.BlogList exposing (bloglistView)

import Html exposing (..)
import Html.Attributes exposing (href, type_, value, class, for, id, placeholder)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)
import ViewHelpers exposing (navigationOnClick, contactLink)
import Routing exposing (Route(..), urlFor, routingItemBlog)
import Markdown exposing (toHtml)
import Types exposing (BlogMetaInfo)


bloglistView : Model -> Html Msg
bloglistView model =
    div [ id "blog-layout", class "pure-g" ]
        [ blogHeader model
        , content model
        ]


blogHeader : Model -> Html Msg
blogHeader model =
    div [ class "sidebar pure-u-1 pure-u-md-1-4" ]
        [ div [ class "blog-header" ]
            [ h1 [ class "brand-title" ] [ text "Meilab Blog" ]
            , h2 [ class "brand-tagline" ] [ text "Elixir Phoenix Elm ReactNative C MQTT Socket" ]
            , navContainer model
            ]
        ]


content : Model -> Html Msg
content model =
    div [ class "content pure-u-1 pure-u-md-3-4" ]
        [ div []
            [ posts model
            , footer
            ]
        ]


posts : Model -> Html Msg
posts model =
    div [ class "posts" ]
        (model.blogList
            |> List.map post
        )


post : BlogMetaInfo -> Html Msg
post blogMetaInfo =
    section [ class "post" ]
        [ header [ class "post-header" ]
            [ img [] []
            , h2 [ class "post-title" ] [ text blogMetaInfo.title ]
            , p [ class "post-meta" ]
                [ text "By"
                , a [ class "post-author" ] [ text blogMetaInfo.author ]
                , text "Under"
                , a [ class "post-category post-category-design" ] [ text "Pure" ]
                , a [ class "post-category post-category-pure" ] [ text "CSS" ]
                ]
            ]
        , div [ class "post-description" ]
            [ toHtml [] blogMetaInfo.description
            ]
        ]


footer : Html Msg
footer =
    div [ class "footer" ]
        [ div [ class "pure-menu pure-menu-horizontal" ]
            [ ul []
                [ contactLink "http://pureccss.io" "fa fa-home" ""
                , contactLink "http://github.com/meilab/" "fa fa-github-alt" ""
                , contactLink "http://github.com/yahoo/pure" "fa fa-weibo" ""
                , contactLink "http://github.com/yahoo/pure" "fa fa-wechat" ""
                ]
            ]
        ]


navContainer : Model -> Html Msg
navContainer model =
    nav [ class "nav" ]
        [ ul [ class "nav-list" ]
            (List.map (navItem model) (routingItemBlog model.url.src_url))
        ]


navItem : Model -> ( String, String, Route, String ) -> Html Msg
navItem model ( title, iconClass, route, slug ) =
    li [ class "nav-item" ]
        [ a
            [ href slug
            , navigationOnClick (route |> (urlFor model.url.src_url) |> NewUrl)
            , class "pure-button"
            ]
            [ text title
            ]
        ]
