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
import Views.PostList exposing (postlistView)
import Views.PostDetail exposing (postdetailView)
import ViewHelpers exposing (menuHeadingLinkItem, navItem, layoutHeader)
import Routing exposing (routingItem)
import Html.CssHelpers
import Styles.LayoutStyle as Style


{ id, class, classList } =
    Html.CssHelpers.withNamespace "meilab"


view : Model -> Html Msg
view model =
    let
        contentView =
            case model.route of
                HomeRoute ->
                    homeView model

                LoginRoute ->
                    loginView model

                LogoutRoute ->
                    loginView model

                RegisterRoute ->
                    loginView model

                PostListRoute ->
                    postlistView model

                PostDetailRoute slug ->
                    postdetailView model slug

                ProjectListRoute ->
                    postlistView model

                ProjectDetailRoute slug ->
                    postdetailView model slug

                TrainingListRoute ->
                    postlistView model

                NotFoundRoute ->
                    notFoundView

        ( layoutClass, contentOnClickCmd ) =
            case model.ui.sideMenuActive of
                True ->
                    ( Style.MenuActive, ToggleSideMenu )

                False ->
                    ( Style.MenuInActive, NoOp )
    in
        case model.route of
            HomeRoute ->
                homeView model

            PostListRoute ->
                postlistView model

            PostDetailRoute slug ->
                postdetailView model slug

            LoginRoute ->
                loginView model

            _ ->
                div [ class [ Style.Layout, layoutClass ] ]
                    [ menu model
                    , layoutHeader model "HNA" routingItemNormalHeader

                    -- , defaultHeader
                    , div [ onClick contentOnClickCmd ]
                        [ contentView
                        ]
                    ]


menu : Model -> Html Msg
menu model =
    div [ class [ Style.SideBarMenu ] ]
        [ nav [ class [ Style.MenuContainer ] ]
            [ (menuHeadingLinkItem "" "/" "HNA")
            , ul
                [ class [ Style.MenuList ] ]
                (List.map (navItem model) (routingItem model.url.src_url))
            ]
        ]


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
