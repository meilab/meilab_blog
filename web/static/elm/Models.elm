module Models exposing (..)

import Routing exposing (Route)
import Maybe exposing (Maybe)
import Types exposing (User, BlogList)


initialUser : User
initialUser =
    { username = ""
    , password = ""
    , token = Nothing
    }


type alias Ui =
    { selectedMenuTab : Int
    , sideMenuActive : Bool
    }


type alias Url =
    { origin : String
    , src_url : String
    , api_url : String
    }


type alias Model =
    { ui : Ui
    , route : Routing.Route
    , url : Url
    , user : User
    , newMessage : String
    , latitude : Float
    , longitude : Float
    , blogList : BlogList
    }


initialModel : Route -> Url -> Int -> Model
initialModel route url selectedMenuTab =
    { ui = Ui selectedMenuTab False
    , route = route
    , url = url
    , user = initialUser
    , newMessage = ""
    , latitude = 34.1243494
    , longitude = 108.59336
    , blogList = []
    }
