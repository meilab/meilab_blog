module Styles.LayoutCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Colors exposing (..)
import Css.Namespace exposing (namespace)
import Html.CssHelpers exposing (withNamespace)
import Styles.Matrix exposing (..)
import Styles.Colors exposing (..)
import Styles.SharedStyles exposing (..)


css : Stylesheet
css =
    (stylesheet << namespace meilabNamespace.name)
        [ body
            [ fontSize (px 13)
            , lineHeight (Css.em 1.5)
            , backgroundColor background
            ]
        , class Layout
            [ displayFlex
            , flexDirection row
            ]
        , class SideBarWrapper
            [ flex3 (int 0) (int 0) menuWidth ]
        , class ContentWrapper
            [ flex (int 1)
            , displayFlex
            , flexDirection column
            ]
        , class SideBarMenu
            [ position fixed
            , width menuWidth
            , height (vh 100)
            , displayFlex
            , flexDirection column
            , justifyContent flexStart
            , backgroundColor ember
            ]
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
            ]
        , class LayoutNavBar
            [ flex3 (int 0) (int 0) navBarHeight
            ]
        , each [ class FixedNavBarContainer, class LayoutNavBar ]
            [ backgroundColor teal
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
        , class VerticalMenuList
            [ flexDirection column ]
        , class Footer
            [ backgroundColor background
            , height navBarHeight
            , textAlign center
            , displayFlex
            , justifyContent center
            , alignItems center
            , textAlign center
            ]
        , mediaQuery "screen and (min-width: 48em)"
            []
        ]
