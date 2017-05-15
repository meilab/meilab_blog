module Messages exposing (..)

import Navigation exposing (Location)
import Types exposing (AuthResponse, PostList)
import Http


type Msg
    = SelectMenuTab Int
    | NewUrl String
    | OnLocationChange Location
    | AuthRequest
    | OnAuthCmdResponse (Result Http.Error AuthResponse)
    | OnPostListResponse (Result Http.Error PostList)
    | Username String
    | Password String
    | Logout
    | StartChat
    | MessageInput String
    | DeliverMessage
    | SetLatitude Float
    | SetLongitude Float
    | SetLatLong Float Float
    | ToggleSideMenu
    | NoOp
