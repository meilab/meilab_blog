module Styles.MarketingStyle exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Colors exposing (..)
import Css.Namespace exposing (namespace)
import Html.CssHelpers exposing (withNamespace)
import Styles.Matrix exposing (..)
import Styles.Colors exposing (..)


type CssClass
    = Layout
    | SplashContainer
    | Splash
    | SplashHead
    | SplashSubhead
    | ContentContainer
    | Content
    | ContentHead
    | ContentHeadRibbon
    | ContentSubhead
    | Ribbon
    | Footer
    | GroupContainer
    | SubContainer
    | Button


marketingNamespace : Html.CssHelpers.Namespace String class id msg
marketingNamespace =
    withNamespace "meilab"


css : Stylesheet
css =
    (stylesheet << namespace marketingNamespace.name)
        [ class Layout
            [ displayFlex
            , flexDirection column
            ]
        , class SplashContainer
            [ flex3 zero zero (vh 88)
            , backgroundColor teal
            ]
        , class Splash
            [ displayFlex
            , flexDirection column
            , justifyContent center
            , alignItems center
            ]
        , class SplashHead
            [ color snow
            , fontWeight bold
            ]
        , class SplashSubhead
            [ color snow ]
        , class ContentContainer
            [ flex (int 1)
            , displayFlex
            , flexDirection column
            , justifyContent spaceBetween
            , alignItems flexStart
            , padding (Css.rem 1)
            ]
        , class GroupContainer
            [ displayFlex
            , flexDirection column
            ]
        , class SubContainer
            [ marginBottom (Css.rem 1)
            , displayFlex
            , flexDirection column
            , marginTop auto
            ]
        , class ContentSubhead
            [ color facebook ]
        , class Footer
            [ backgroundColor background
            , height navBarHeight
            , textAlign center
            , displayFlex
            , justifyContent center
            , alignItems center
            , textAlign center
            ]
        , mediaQuery "screen and ( min-width: 48em)"
            [ body
                [ fontSize (px 16) ]
            , class SplashContainer
                [ height (vh 50) ]
            , class GroupContainer
                [ flexDirection row
                , flexWrap wrap
                , justifyContent spaceBetween
                ]
            , class SubContainer
                [ flex3 zero zero (pct 48)
                , padding (Css.rem 1)
                ]
            ]
        ]
