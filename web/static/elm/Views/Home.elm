module Views.Home exposing (homeView)

import Html exposing (Html, form, img, button, i, h1, h2, h3, h4, p, span, a, div, ul, li, text, nav, header, fieldset, label, input)
import Html.Attributes exposing (type_, value, class, for, id, placeholder, width, alt, src)
import Html.Events exposing (onInput, onSubmit)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Json.Decode as JD exposing (..)
import Views.Map exposing (mapView)
import ViewHelpers exposing (marketingFixedNavBar, predefinedLinkItem)
import Routing exposing (routingItemHomePage)
import Styles.SharedStyles exposing (..)
import Html.CssHelpers


{ id, class, classList } =
    Html.CssHelpers.withNamespace "meilab"


homeView : Model -> Html Msg
homeView model =
    div [ class [ MarketingLayout ] ]
        [ marketingFixedNavBar model "Meilab" routingItemHomePage
        , splash

        -- , mapView model
        , content model
        , footer
        ]


splash : Html Msg
splash =
    div [ class [ SplashContainer ] ]
        [ div [ class [ Splash ] ]
            [ h1 [ class [ SplashHead ] ] [ text "meilab" ]
            , p [ class [ SplashSubhead ] ] [ text "前沿技术培训 项目咨询" ]
            , p []
                [ predefinedLinkItem (class [ Button ]) "" "/projectlist" "Get Started" ]
            ]
        ]


content : Model -> Html Msg
content model =
    div [ class [ ContentContainer ] ]
        [ projects
        , services
        , contact
        ]


contact : Html Msg
contact =
    div [ class [ Content ] ]
        [ contentHead "Meta Info"
        , contactDetail
        ]


projects : Html Msg
projects =
    div [ class [ Content ] ]
        [ contentHead "项目"
        , projectsDetail
        ]


services : Html Msg
services =
    div [ class [ Ribbon, GroupContainer ] ]
        [ div [ class [ SubContainer ] ]
            [ img
                [ width 300
                , alt "File Icons"
                , src "images/phoenix.png"
                ]
                []
            ]
        , div [ class [ SubContainer ] ]
            [ h2 [ class [ ContentHead, ContentHeadRibbon ] ] [ text "提供服务" ]
            , p [] [ text "项目开发 培训 咨询" ]
            ]
        ]


projectsDetail : Html Msg
projectsDetail =
    div [ class [ GroupContainer ] ]
        [ div [ class [ SubContainer ] ]
            [ h3 [ class [ ContentSubhead ] ]
                [ i [ Html.Attributes.class "fa fa-mobile" ] []
                , text "物联网平台"
                ]
            , p [] [ text "智能连接一切设备，实时追踪，控制" ]
            , p [] [ text "技术栈：Elixir, MQTT, Elm, C, React-Native" ]
            ]
        , div [ class [ GroupContainer ] ]
            [ h3 [ class [ ContentSubhead ] ]
                [ i [ Html.Attributes.class "fa fa-rocket" ] []
                , text "区块链平台"
                ]
            , p [] [ text "分布式账簿" ]
            , p [] [ text "技术栈：Elixir, Blockchain, Elm" ]
            ]
        , div [ class [ GroupContainer ] ]
            [ h3 [ class [ ContentSubhead ] ]
                [ i [ Html.Attributes.class "fa fa-th-large" ] []
                , text "会议系统，协作平台"
                ]
            , p [] [ text "多人视频会议，桌面共享" ]
            , p [] [ text "技术栈：Elixir, WebRTC, Elm, Socket" ]
            ]
        , div [ class [ GroupContainer ] ]
            [ h3 [ class [ ContentSubhead ] ]
                [ i [ Html.Attributes.class "fa fa-check-square-o" ] []
                , text "聊天机器人"
                ]
            , p [] [ text "智能聊天机器人" ]
            , p [] [ text "技术栈：Elixir, NLP, Elm" ]
            ]
        ]


contactDetail : Html Msg
contactDetail =
    div [ class [ GroupContainer ] ]
        [ div [ class [ SubContainer ] ]
            [ form [ Html.Attributes.class "pure-form pure-form-stacked" ]
                [ fieldset []
                    [ label [ for "name" ] [ text "Your Name" ]
                    , input [ type_ "text", placeholder "Your Name" ] []
                    , label [ for "email" ] [ text "Your Email" ]
                    , input [ type_ "text", placeholder "Your Email" ] []
                    , label [ for "password" ] [ text "Your Password" ]
                    , input [ type_ "text", placeholder "Your Password" ] []
                    , button [ type_ "submit", class [ Button ] ] [ text "Sign Up" ]
                    ]
                ]
            ]
        , div [ class [ SubContainer ] ]
            [ h4 [] [ text "Contact Us" ]
            , p [] [ text "Meilab" ]
            , h4 [] [ text "More Info" ]
            , p [] [ text "Meilab： 提供最前沿的物联网行业解决方案，培训，咨询服务" ]
            ]
        ]


footer : Html Msg
footer =
    div [ class [ Footer ] ]
        [ text "Meilab" ]


contentHead : String -> Html Msg
contentHead str =
    h2 [ class [ ContentHead ] ] [ text str ]



-- div []
--     [ mapView model
--     ]
