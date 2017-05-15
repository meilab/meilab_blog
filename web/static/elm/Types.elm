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


type alias BlogList =
    List BlogMetaInfo


type alias BlogMetaInfo =
    { slug : String
    , author : String
    , title : String
    , description : String
    , date : String
    , tags : List String
    , headerimg : String
    , pinned : Bool
    , published : Bool
    }
