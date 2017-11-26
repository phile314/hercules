module Route exposing (..)

import Debug
import Navigation exposing (Location)
import String
import UrlParser exposing (Parser, (</>), map, int, oneOf, s, string, parsePath)


{-| Main type representing current url/route
-}
type Route
    = Projects


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Projects (s "")
        ]


routeToURL : Route -> String
routeToURL route =
    case route of
        Projects ->
            "/project/"


routeToTitle : Route -> String
routeToTitle route =
    case route of
        Projects ->
            "Projects"


modifyUrl : Route -> Cmd msg
modifyUrl = routeToURL >> Navigation.modifyUrl

fromLocation : Location -> Maybe Route
fromLocation location = Debug.log "location" (
  if String.isEmpty location.pathname then
    Just Projects
  else
    parsePath routeParser location)
