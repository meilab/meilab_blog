module Styles.SharedStyles exposing (..)

import Html.CssHelpers exposing (withNamespace)


type CssClasses
    = Layout
    | SideBarWrapper
    | SideBarMenu
    | ContentWrapper
    | MenuContainer
    | NavBarWrapper
    | FixedNavBarContainer
    | MenuSelected
    | LayoutNavBar
    | MenuItem
    | MenuList
    | VerticalMenuList
    | MenuLink
    | MenuActive
    | MenuInActive
    | Footer
      -- For Marketing
    | MarketingLayout
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
    | GroupContainer
    | SubContainer
      -- for Blog
    | BlogLayout
    | BlogSideBarWrapper
    | BlogSideBarMenu
    | BrandTitle
    | BrandTagline
    | BlogContent
    | Posts
    | PostContainer
    | PostHeader
    | PostTitle
    | PostMeta
    | PostAuthor
    | PostCategory
    | PostDescription
      -- for Button
    | Button
    | PrimaryButton


meilabNamespace : Html.CssHelpers.Namespace String class id msg
meilabNamespace =
    withNamespace "meilab"
