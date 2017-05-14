module Types exposing (..)


type alias AuthResponse =
    { code : String
    , token : String
    }


type alias User =
    { username : String
    , password : String
    , token : Maybe String
    }
