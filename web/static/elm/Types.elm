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


type alias PostList =
    List PostMetaInfo


type alias PostMetaInfo =
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
