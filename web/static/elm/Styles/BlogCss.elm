module Styles.BlogCss exposing (..)

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
        [ class BlogLayout
            [ displayFlex
            , flexDirection column
            ]
        , class BlogSideBarWrapper
            [ backgroundColor gray ]
        , class BlogSideBarMenu
            [ displayFlex
            , flexDirection column
            , justifyContent center
            , alignItems center
            , textAlign center
            ]
        , mediaQuery "screen and (min-width: 48em)"
            [ class BlogLayout
                [ flexDirection row ]
            , class BlogSideBarMenu
                [ position fixed
                , width (pct 35)
                , height (vh 100)
                ]
            , class BlogSideBarWrapper
                [ flex (pct 35)
                ]
            , class BlogContent
                [ flex (pct 65) ]
            ]
        ]
