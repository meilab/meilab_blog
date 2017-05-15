module Routing exposing(..)

import Navigation exposing (Location)
import UrlParser exposing (..)
import Maybe exposing(Maybe)
import Html exposing(Html, text)
import Array exposing(Array)
import Dict exposing(Dict)

type Route
  = HomeRoute
  | LoginRoute
  
  -- clear userinfo and redirect to HomeRoute
  | LogoutRoute
  | RegisterRoute
  | PostListRoute
  | PostDetailRoute String
  | ProjectListRoute
  | ProjectDetailRoute String
  | TrainingListRoute
  | NotFoundRoute

parseAppend : String -> Parser a a -> Parser a a
parseAppend src_url item =
  case src_url of
    "" ->
      item

    _ ->
      src_url
      |> String.dropLeft 1
      |> String.split "/"
      |> List.map ( s )
      |> List.reverse
      |> List.foldl ( </> )( item )

matchers : String -> Parser (Route -> a) a
matchers src_url =
  oneOf
    [ map HomeRoute ( parseAppend src_url top )
    , map LoginRoute ( parseAppend src_url ( s "login" ) )
    , map LogoutRoute ( parseAppend src_url ( s "logout" ) )
    , map RegisterRoute ( parseAppend src_url ( s "register" ) )
    , map PostListRoute ( parseAppend src_url ( s "postlist" ) )
    , map PostDetailRoute ( parseAppend src_url ( s "postdetail" ) </> string )
    , map ProjectListRoute ( parseAppend src_url ( s "projectlist" ) )
    , map ProjectDetailRoute ( parseAppend src_url ( s "projectdetail" ) </> string )
    ]

parseLocation : Location -> String -> Route
parseLocation location src_url =
  case ( parsePath ( matchers src_url ) location ) of
    Just route ->
      route
    Nothing ->
      NotFoundRoute

urlFor : String -> Route -> String
urlFor src_url route =
  case route of
    HomeRoute ->
      src_url
    LoginRoute ->
      src_url ++ "/login"
    LogoutRoute ->
      src_url ++ "/logout"
    RegisterRoute ->
      src_url ++ "/register"
    PostListRoute ->
      src_url ++ "/postlist"
    PostDetailRoute slug->
      src_url ++ "/postdetail" ++ slug
    ProjectListRoute ->
      src_url ++ "/projectlist"
    ProjectDetailRoute slug->
      src_url ++ "/projectdetail" ++ slug
    TrainingListRoute ->
      src_url ++ "/traininglist"
    NotFoundRoute ->
      src_url


routingItem : String -> List ( String, String, Route, String )
routingItem src_url =
  [ ( "Post", "fa fa-apps", PostListRoute, src_url ++ "/postlist" )
  , ( "Project", "fa fa-list", ProjectListRoute, src_url ++ "/projectlist" )
  , ( "Login", "fa fa-male", LoginRoute, src_url ++ "/login" )
  ]

routingItemHomePage : String -> List ( String, String, Route, String )
routingItemHomePage src_url =
  [ ( "Post", "fa fa-apps", PostListRoute, src_url ++ "/postlist" )
  , ( "Project", "fa fa-list", ProjectListRoute, src_url ++ "/projectlist" )
  , ( "Login", "fa fa-male", LoginRoute, src_url ++ "/login" )
  ]

routingItemNormalHeader : String -> List ( String, String, Route, String )
routingItemNormalHeader src_url =
  [ ( "Post", "fa fa-apps", PostListRoute, src_url ++ "/postlist" )
  , ( "Project", "fa fa-list", ProjectListRoute, src_url ++ "/projectlist" )
  , ( "Login", "fa fa-male", LoginRoute, src_url ++ "/login" )
  ]

routingItemPost : String -> List ( String, String, Route, String )
routingItemPost src_url =
  [ ( "PostHome", "fa fa-apps", PostListRoute, src_url ++ "/postlist" )
  , ( "Meilab", "fa fa-list", HomeRoute, src_url ++ "/" )
  , ( "Training", "fa fa-male", TrainingListRoute, src_url ++ "/login" )
  ]

tabsTitles : String -> List (Html a)
tabsTitles src_url =
  routingItem src_url
  |> List.map (\(title, _, _, _) -> (text title))

tabsUrls : String -> Array String
tabsUrls src_url =
  routingItem src_url
  |> List.map ( \(_, _, _, url) -> url )
  |> Array.fromList

urlTabs : String -> Dict String Int
urlTabs src_url =
    routingItem src_url
    |> List.indexedMap (\idx (_, _, _, url) -> ( url, idx ))
    |> Dict.fromList