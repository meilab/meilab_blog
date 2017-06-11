module Styles.LayoutStyle exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Colors exposing (..)
import Css.Namespace exposing (namespace)
import Html.CssHelpers exposing (withNamespace)
import Styles.Matrix exposing (..)
import Styles.Colors exposing (..)


type CssClass
    = Layout
    | SideBarMenu
    | MenuContainer
    | NavBarWrapper
    | FixedNavBarContainer
    | MenuSelected
    | LayoutHeader
    | MenuItem
    | MenuList
    | MenuLink
    | MenuActive
    | MenuInActive


layoutNamespace : Html.CssHelpers.Namespace String class id msg
layoutNamespace =
    withNamespace "meilab"


css : Stylesheet
css =
    (stylesheet << namespace layoutNamespace.name)
        [ body
            [ fontSize (px 13)
            , lineHeight (Css.em 1.5)
            , backgroundColor background
            ]
        , class Layout
            [ displayFlex ]
        , class MenuContainer
            [ displayFlex
            , justifyContent spaceBetween
            , alignItems center
            ]
        , class NavBarWrapper
            [ flex3 (int 0) (int 0) navBarHeight ]
        , class FixedNavBarContainer
            [ position fixed
            , width (vw 100)
            , backgroundColor teal
            , displayFlex
            , justifyContent stretch
            , alignItems center
            , padding (Css.rem 1)
            ]
        , class MenuList
            [ listStyle none
            , flex (int 1)
            , displayFlex
            , justifyContent spaceAround
            , alignItems center
            , descendants
                [ a
                    [ textDecoration none ]
                ]
            ]
        , mediaQuery "screen and (min-width: 48em)"
            []
        ]
