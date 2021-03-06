module ViewHelpers exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg(..))
import Routing exposing (routingItem, urlFor)
import Html.Events exposing (onInput)
import Json.Decode as JD
import Models exposing (Model)
import Routing exposing (Route)
import Html.CssHelpers
import Styles.SharedStyles exposing (..)
import Styles.SharedStyles


{ id, class, classList } =
    Html.CssHelpers.withNamespace "meilab"


navigationOnClick : Msg -> Attribute Msg
navigationOnClick msg =
    Html.Events.onWithOptions "click"
        { stopPropagation = False
        , preventDefault = True
        }
        (JD.succeed msg)


navContainer : Model -> Html Msg
navContainer model =
    nav [ class [ MenuContainer ] ]
        [ ul [ class [ MenuList ] ]
            (List.map (navItem model) (routingItem model.url.src_url))
        ]


marketingFixedNavBar : Model -> String -> (String -> List ( String, String, Route, String )) -> Html Msg
marketingFixedNavBar model siteTitle routingItem =
    div [ class [ NavBarWrapper ] ]
        [ nav [ class [ FixedNavBarContainer ] ]
            [ ul [ class [ MenuList ] ]
                [ menuHeadingLinkItem "" "/" siteTitle ]
            , ul
                [ class [ MenuList ] ]
                (List.map (navItem model) (routingItem model.url.src_url))
            ]
        ]


layoutNavBar : Model -> String -> (String -> List ( String, String, Route, String )) -> Html Msg
layoutNavBar model siteTitle routingItem =
    nav
        [ class [ LayoutNavBar ]
        ]
        [ ul
            [ class [ MenuList ] ]
            [ menuHeadingLinkItem "" "/" siteTitle ]
        , ul
            [ class [ MenuList ] ]
            (List.map (navItem model) (routingItem model.url.src_url))
        ]


linkItem : Attribute Msg -> Msg -> Attribute Msg -> String -> String -> String -> Html Msg
linkItem liClass onClickCmd aClass iconClass slug textToShow =
    li
        [ class [ MenuItem ]
        , liClass
        ]
        [ a
            [ href slug
            , navigationOnClick (onClickCmd)
            , aClass
            ]
            [ i [ Html.Attributes.class iconClass ] []
            , text textToShow
            ]
        ]


predefinedLinkItem : Attribute Msg -> String -> String -> String -> Html Msg
predefinedLinkItem aClass iconClass slug textToShow =
    linkItem (class []) NoOp aClass iconClass slug textToShow


menuHeadingLinkItem : String -> String -> String -> Html Msg
menuHeadingLinkItem iconClass slug textToShow =
    linkItem (class []) NoOp (class []) iconClass slug textToShow


normalLinkItem : String -> String -> Html Msg
normalLinkItem slug textToShow =
    predefinedLinkItem (class []) "" slug textToShow


navItem : Model -> ( String, String, Route, String ) -> Html Msg
navItem model ( title, iconClass, route, slug ) =
    let
        isCurrentLocation =
            model.route == route

        ( onClickCmd, selectedClass ) =
            case ( isCurrentLocation, route ) of
                ( False, route ) ->
                    ( route |> (urlFor model.url.src_url) |> NewUrl
                    , class []
                    )

                _ ->
                    ( NoOp
                    , class [ MenuSelected ]
                    )
    in
        linkItem selectedClass
            onClickCmd
            (class [])
            iconClass
            slug
            title



-- socialLink : String -> String -> Html Msg
-- socialLink slug iconClass =
--     li [ class [ MenuItem ] ]
--         [ externalLinkItem slug (class [ SocialLink ]) iconClass ""
--         ]


contactLink : String -> String -> String -> Html Msg
contactLink slug iconClass textToShow =
    li [ class [ MenuItem ] ]
        [ externalLinkItem slug (class [ MenuLink ]) iconClass textToShow
        ]


externalLinkItem : String -> Attribute Msg -> String -> String -> Html Msg
externalLinkItem slug linkClass iconClass textToShow =
    a [ linkClass, href slug ]
        [ i [ Html.Attributes.class iconClass ] [ text textToShow ] ]
