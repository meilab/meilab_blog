module Update exposing (..)

import Messages exposing (Msg(..))
import Models
    exposing
        ( Model
        , initialUser
        , Ui
        )
import Navigation
import Routing exposing (Route(..), parseLocation, tabsUrls, urlTabs)
import Array exposing (Array)
import Dict exposing (Dict)
import Helpers exposing (cmd)
import Commands exposing (authRequest, getPostList)


changeUrlCommand : Model -> Route -> Cmd Msg
changeUrlCommand model route =
    case model.user.token of
        Nothing ->
            case route of
                LoginRoute ->
                    Cmd.none

                HomeRoute ->
                    Cmd.none

                PostListRoute ->
                    getPostList model.user.token model.url.api_url

                PostDetailRoute slug ->
                    Cmd.none

                ProjectListRoute ->
                    Cmd.none

                ProjectDetailRoute slug ->
                    Cmd.none

                _ ->
                    Navigation.newUrl (model.url.src_url ++ "/login")

        Just token ->
            changeUrlCommandAfterLogin model route


changeUrlCommandAfterLogin : Model -> Route -> Cmd Msg
changeUrlCommandAfterLogin model route =
    case route of
        LogoutRoute ->
            Navigation.newUrl (model.url.src_url ++ "/")

        _ ->
            Cmd.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectMenuTab num ->
            let
                url =
                    Array.get num (tabsUrls model.url.src_url)
                        |> Maybe.withDefault model.url.src_url
            in
                ( { model | ui = (Ui num model.ui.sideMenuActive) }, Navigation.newUrl url )

        NewUrl url ->
            model ! [ (Navigation.newUrl url) ]

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location model.url.src_url

                newUser =
                    case newRoute of
                        LogoutRoute ->
                            initialUser

                        _ ->
                            model.user

                newSelectedMenuTab =
                    Dict.get location.pathname (urlTabs model.url.src_url)
                        |> Maybe.withDefault -1
            in
                ( { model | route = newRoute, ui = Ui newSelectedMenuTab model.ui.sideMenuActive, user = newUser }
                , changeUrlCommand model newRoute
                )

        Username username ->
            let
                newUser =
                    { username = username
                    , password = model.user.password
                    , token = model.user.token
                    }
            in
                ( { model | user = newUser }, Cmd.none )

        Password password ->
            let
                newUser =
                    { username = model.user.username
                    , password = password
                    , token = model.user.token
                    }
            in
                ( { model | user = newUser }, Cmd.none )

        AuthRequest ->
            ( model
            , authRequest
                model.user.token
                model.url.api_url
                model.user.username
                model.user.password
            )

        OnAuthCmdResponse (Ok responseInfo) ->
            let
                token =
                    case responseInfo.code of
                        "200" ->
                            Just responseInfo.token

                        _ ->
                            Nothing

                newUser =
                    { username = model.user.username
                    , password = model.user.password
                    , token = token
                    }

                newCmd =
                    case token of
                        Just exhibitionToken ->
                            Navigation.newUrl (model.url.src_url ++ "/postlist")

                        Nothing ->
                            Cmd.none
            in
                ( { model | user = newUser }, newCmd )

        OnAuthCmdResponse (Err error) ->
            Debug.log (toString (error))
                ( model, Cmd.none )

        OnPostListResponse (Ok postList) ->
            ( { model | postList = postList }, Cmd.none )

        OnPostListResponse (Err error) ->
            Debug.log (toString (error))
                ( model, Cmd.none )

        Logout ->
            ( { model | user = initialUser }, Navigation.newUrl (model.url.src_url ++ "/login") )

        StartChat ->
            ( model, Navigation.newUrl (model.url.src_url ++ "/botdetail") )

        MessageInput message ->
            ( { model | newMessage = message }, Cmd.none )

        DeliverMessage ->
            ( model, Cmd.none )

        SetLatitude latitude ->
            ( { model | latitude = latitude }, Cmd.none )

        SetLongitude longitude ->
            ( { model | longitude = longitude }, Cmd.none )

        SetLatLong latitude longitude ->
            { model | latitude = latitude, longitude = longitude } ! []

        ToggleSideMenu ->
            ( { model | ui = Ui model.ui.selectedMenuTab (not model.ui.sideMenuActive) }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )
