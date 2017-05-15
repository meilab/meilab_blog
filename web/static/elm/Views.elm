module Views exposing (..)

import Html exposing (Html, span, a, div, ul, li, text, nav, header)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Dict exposing (Dict)
import Array exposing (Array)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Markdown
import Routing exposing (Route(..), routingItem, tabsTitles, routingItemNormalHeader)
import Views.Home exposing (homeView)
import Views.Login exposing (loginView)
import Views.BlogList exposing (bloglistView)
import Views.BlogDetail exposing (blogdetailView)
import ViewHelpers exposing (menuHeading, navItem, fixedHeader, menuLinkItem)
import Routing exposing (routingItem)


view : Model -> Html Msg
view model =
    let
        ( contentView, viewHeader ) =
            case model.route of
                HomeRoute ->
                    ( homeView model, defaultHeader "HNA Smart Container" )

                LoginRoute ->
                    ( loginView model, defaultHeader "Login" )

                LogoutRoute ->
                    ( loginView model, defaultHeader "Logout" )

                RegisterRoute ->
                    ( loginView model, defaultHeader "Sign Up" )

                BlogListRoute ->
                    ( bloglistView model, defaultHeader "BlogList" )

                BlogDetailRoute slug ->
                    ( blogdetailView model slug, defaultHeader "BlogDetail" )

                ProjectListRoute ->
                    ( bloglistView model, defaultHeader "ProjectList" )

                ProjectDetailRoute slug ->
                    ( blogdetailView model slug, defaultHeader "BlogDetail" )

                TrainingListRoute ->
                    ( bloglistView model, defaultHeader "TrainingList" )

                NotFoundRoute ->
                    ( notFoundView, defaultHeader "Page Not Found" )

        ( layoutClass, contentOnClickCmd ) =
            case model.ui.sideMenuActive of
                True ->
                    ( "active", ToggleSideMenu )

                False ->
                    ( "", NoOp )
    in
        case model.route of
            HomeRoute ->
                homeView model

            BlogListRoute ->
                bloglistView model

            BlogDetailRoute slug ->
                blogdetailView model slug

            LoginRoute ->
                loginView model

            _ ->
                div [ id "layout", class layoutClass ]
                    [ menuLinkItem "#menu" "" "menu-link"
                    , menu model
                    , fixedHeader model "HNA" routingItemNormalHeader

                    -- , defaultHeader
                    , div [ onClick contentOnClickCmd ]
                        [ contentView
                        ]
                    ]


menu : Model -> Html Msg
menu model =
    div [ id "menu" ]
        [ nav [ class "pure-menu" ]
            [ (menuHeading "/" "HNA")
            , ul
                [ class "pure-menu-list" ]
                (List.map (navItem model) (routingItem model.url.src_url))
            ]
        ]


defaultHeader : String -> Html Msg
defaultHeader title =
    header
        [ class "head" ]
        [ text title ]



-- viewDrawerMenuItem : Model -> ( String, String, String, Route, Msg ) -> Html Msg
-- viewDrawerMenuItem model (agentName, agnetId, iconName, route, onClick) =
--   let
--     isCurrentAgent =
--       model.agentIdSelected == Just agnetId
--     onClickCmd =
--       case ( isCurrentAgent, onClick ) of
--         ( False, onClick ) ->
--           onClick |> Options.onClick
--         _ ->
--           Options.nop
--   in
--     Layout.link
--       [ onClickCmd
--       , when isCurrentAgent (Color.background <| Color.color Color.BlueGrey Color.S600)
--       , Options.css "color" "rgba(255, 255, 255, 0.56)"
--       , Options.css "font-weight" "500"
--       ]
--       [
--         Icon.view iconName
--         [ Color.text <| Color.color Color.BlueGrey Color.S500
--         , Options.css "margin-right" "32px"
--         ]
--       , text agentName
--       ]
-- viewDrawer : Model -> Html Msg
-- viewDrawer model =
--   Layout.navigation
--     [ Color.background <| Color.color Color.BlueGrey Color.S800
--     , Color.text <| Color.color Color.BlueGrey Color.S50
--     , Options.css "flex-grow" "1"
--     ]
--   <|
--     ( List.map (viewDrawerMenuItem model) ( viewDrawerItem model.agents ) )
-- viewDrawerItem : List Agent -> List ( String, String, String, Route, Msg )
-- viewDrawerItem agents =
--   agents
--   |> List.map agentItem
-- agentItem : Agent -> ( String, String, String, Route, Msg )
-- agentItem agent =
--   ( agent.name, agent.id, "inbox", BotDetailRoute, AgentSelected agent.id)
-- drawerHeader : Model -> Html Msg
-- drawerHeader model =
--   Options.styled Html.header
--     [ css "display" "flex"
--     , css "box-sizing" "border-box"
--     , css "justify-content" "flex-end"
--     , css "padding" "16px"
--     , css "height" "151px"
--     , css "flex-direction" "column"
--     , cs "demo-header"
--     , Color.background <| Color.color Color.BlueGrey Color.S900
--     , Color.text <| Color.color Color.BlueGrey Color.S50
--     ]
--     [ Options.styled Html.img
--         [ Options.attribute <| src "images/logo.png"
--         , css "width" "48px"
--         , css "height" "48px"
--         , css "border-radius" "24px"
--         ]
--         []
--       , Options.styled Html.div
--         [ css "display" "flex"
--         , css "flex-direction" "row"
--         , css "align-items" "center"
--         , css "width" "100%"
--         , css "position" "relative"
--         ]
--         [ Html.span [][ text "Come On!"]]
--     ]
-- viewBody : Model -> Html Msg
-- viewBody model =
--   case model.route of
--     HomeRoute ->
--       introView
--     LoginRoute ->
--       loginView model
--     BotListRoute ->
--       botListView model.agents
--     BotDetailRoute ->
--       botDetailView model
--     NotFoundRoute ->
--       notFoundView


introView : Model -> Html Msg
introView model =
    Markdown.toHtml [] markdown


markdown : String
markdown =
    """
# 智能云箱
"""


notFoundView : Html Msg
notFoundView =
    div []
        [ text "没有找到您要的网址" ]
