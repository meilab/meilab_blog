module Styles.PostListSharedStyles exposing (..)

import Html.CssHelpers exposing (withNamespace)


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


blogNamespace : Html.CssHelpers.Namespace String class id msg
blogNamespace =
    withNamespace "blog"
