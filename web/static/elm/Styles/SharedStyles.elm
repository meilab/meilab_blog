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
      -- for Button
    | Button
    | PrimaryButton


meilabNamespace : Html.CssHelpers.Namespace String class id msg
meilabNamespace =
    withNamespace "meilab"
