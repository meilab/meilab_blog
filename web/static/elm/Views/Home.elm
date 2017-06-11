module Views.Home exposing (homeView)

import Html exposing (Html, form, img, button, i, h1, h2, h3, h4, p, span, a, div, ul, li, text, nav, header, fieldset, label, input)
import Html.Attributes exposing (type_, value, class, for, id, placeholder, width, alt, src)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Json.Decode as JD exposing (..)
import Views.Map exposing (mapView)
import ViewHelpers exposing (marketingFixedHeader, predefinedLinkItem)
import Routing exposing (routingItemHomePage)
import Styles.MarketingStyle as Style
import Html.CssHelpers


{ id, class, classList } =
    Html.CssHelpers.withNamespace "meilab"


homeView : Model -> Html Msg
homeView model =
    div [ class [ Style.Layout ] ]
        [ marketingFixedHeader model "Meilab" routingItemHomePage
        , splash

        -- , mapView model
        , content model
        , footer
        ]


splash : Html Msg
splash =
    div [ class [ Style.SplashContainer ] ]
        [ div [ class [ Style.Splash ] ]
            [ h1 [ class [ Style.SplashHead ] ] [ text "meilab" ]
            , p [ class [ Style.SplashSubhead ] ] [ text "前沿技术培训 项目咨询" ]
            , p []
                [ predefinedLinkItem (class [ Style.Button ]) "" "/projectlist" "Get Started" ]
            ]
        ]


content : Model -> Html Msg
content model =
    div [ class [ Style.ContentContainer ] ]
        [ projects
        , services
        , contact
        ]


contact : Html Msg
contact =
    div [ class [ Style.Content ] ]
        [ contentHead "Meta Info"
        , contactDetail
        ]


projects : Html Msg
projects =
    div [ class [ Style.Content ] ]
        [ contentHead "项目"
        , projectsDetail
        ]


services : Html Msg
services =
    div [ class [ Style.Ribbon, Style.GroupContainer ] ]
        [ div [ class [ Style.SubContainer ] ]
            [ img
                [ width 300
                , alt "File Icons"
                , src "images/phoenix.png"
                ]
                []
            ]
        , div [ class [ Style.SubContainer ] ]
            [ h2 [ class [ Style.ContentHead, Style.ContentHeadRibbon ] ] [ text "提供服务" ]
            , p [] [ text "项目开发 培训 咨询" ]
            ]
        ]


projectsDetail : Html Msg
projectsDetail =
    div [ class [ Style.GroupContainer ] ]
        [ div [ class [ Style.SubContainer ] ]
            [ h3 [ class [ Style.ContentSubhead ] ]
                [ i [ Html.Attributes.class "fa fa-mobile" ] []
                , text "物联网平台"
                ]
            , p [] [ text "智能连接一切设备，实时追踪，控制" ]
            , p [] [ text "技术栈：Elixir, MQTT, Elm, C, React-Native" ]
            ]
        , div [ class [ Style.GroupContainer ] ]
            [ h3 [ class [ Style.ContentSubhead ] ]
                [ i [ Html.Attributes.class "fa fa-rocket" ] []
                , text "区块链平台"
                ]
            , p [] [ text "分布式账簿" ]
            , p [] [ text "技术栈：Elixir, Blockchain, Elm" ]
            ]
        , div [ class [ Style.GroupContainer ] ]
            [ h3 [ class [ Style.ContentSubhead ] ]
                [ i [ Html.Attributes.class "fa fa-th-large" ] []
                , text "会议系统，协作平台"
                ]
            , p [] [ text "多人视频会议，桌面共享" ]
            , p [] [ text "技术栈：Elixir, WebRTC, Elm, Socket" ]
            ]
        , div [ class [ Style.GroupContainer ] ]
            [ h3 [ class [ Style.ContentSubhead ] ]
                [ i [ Html.Attributes.class "fa fa-check-square-o" ] []
                , text "聊天机器人"
                ]
            , p [] [ text "智能聊天机器人" ]
            , p [] [ text "技术栈：Elixir, NLP, Elm" ]
            ]
        ]


contactDetail : Html Msg
contactDetail =
    div [ class [ Style.GroupContainer ] ]
        [ div [ class [ Style.SubContainer ] ]
            [ form [ Html.Attributes.class "pure-form pure-form-stacked" ]
                [ fieldset []
                    [ label [ for "name" ] [ text "Your Name" ]
                    , input [ type_ "text", placeholder "Your Name" ] []
                    , label [ for "email" ] [ text "Your Email" ]
                    , input [ type_ "text", placeholder "Your Email" ] []
                    , label [ for "password" ] [ text "Your Password" ]
                    , input [ type_ "text", placeholder "Your Password" ] []
                    , button [ type_ "submit", class [ Style.Button ] ] [ text "Sign Up" ]
                    ]
                ]
            ]
        , div [ class [ Style.SubContainer ] ]
            [ h4 [] [ text "Contact Us" ]
            , p [] [ text "Meilab" ]
            , h4 [] [ text "More Info" ]
            , p [] [ text "Meilab： 提供最前沿的物联网行业解决方案，培训，咨询服务" ]
            ]
        ]


footer : Html Msg
footer =
    div [ class [ Style.Footer ] ]
        [ text "Meilab" ]


contentHead : String -> Html Msg
contentHead str =
    h2 [ class [ Style.ContentHead ] ] [ text str ]



-- div []
--     [ mapView model
--     ]
