module Messages exposing (..)

import Navigation exposing (Location)
import Types exposing (AuthResponse, BlogList)
import Http


type Msg
    = SelectMenuTab Int
    | NewUrl String
    | OnLocationChange Location
    | AuthRequest
    | OnAuthCmdResponse (Result Http.Error AuthResponse)
    | OnBlogListResponse (Result Http.Error BlogList)
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
