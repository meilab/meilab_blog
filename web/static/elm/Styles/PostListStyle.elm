module Styles.PostListStyle exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, li, a)
import Css.Colors exposing (..)
import Css.Namespace exposing (namespace)
import Styles.PostListSharedStyles exposing (..)


type CssClasses
    = Header
    | Sidebar
    | NavListItem
    | NavItem
    | Content
    | Post
    | Footer


type CssIds
    = Layout


css : Stylesheet
css =
    (stylesheet << namespace blogNamespace.name)
        [ a
            [ textDecoration none
            , color (rgb 61 146 201)
            , hover
                [ textDecoration underline
                ]
            ]
        , id Layout
            [ padding zero
            ]
        , class Header
            [ textAlign center
            , top auto
            , margin2 (em 3) auto

            -- , children
            --     [ li
            --         [ (display inlineBlock) |> important
            --         , color primaryAccentColor
            --         ]
            --     ]
            ]
        , class Sidebar
            [ backgroundColor (rgb 61 79 93)
            , color (hex "ffffff")
            ]

        -- , class Brand_title
        -- [ margin zero ]
        , class Content
            [ padding4 (em 2) (em 1) (em 0) (em 0) ]
        , class Post
            [ padding (em 2) ]
        , class Footer
            [ color silver
            , fontSize (pct 80)
            ]
        , mediaQuery "screen and ( minWidth: 48em )"
            [ class Content
                [ padding4 (em 2) (em 3) (em 0) (em 0)
                , marginLeft (pct 25)
                ]
            , class Header
                [ margin4 (pct 80) (em 1) (em 0) (em 0)
                , textAlign right
                ]
            , class Sidebar
                [ position fixed
                , top zero
                , bottom zero
                ]
            , class Footer
                [ textAlign center
                , backgroundColor red
                ]
            ]
        ]


primaryAccentColor : Color
primaryAccentColor =
    hex "ccffaa"
