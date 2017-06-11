module Styles.MarketingCss exposing (..)

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
        [ class MarketingLayout
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
