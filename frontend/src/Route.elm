module Route exposing (..)

import Debug
import Navigation exposing (Location)
import String
import UrlParser exposing (Parser, (</>), map, int, oneOf, s, string, parsePath)


{-| Main type representing current url/route
-}
type Route
    = Projects
    | Project String


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Projects (s "")
        , map Projects (s "project")
        , map Project  (s "project" </> string)
        ]


routeToURL : Route -> String
routeToURL route =
  case route of
    Projects ->
      "/project/"
    Project n ->
      "/project/" ++ n


routeToTitle : Route -> String
routeToTitle route =
  case route of
    Projects ->
      "Projects"
    Project n -> "Project " ++ n


modifyUrl : Route -> Cmd msg
modifyUrl = routeToURL >> Navigation.modifyUrl

fromLocation : Location -> Maybe Route
fromLocation location = Debug.log "location" (
  if String.isEmpty location.pathname then
    Just Projects
  else
    parsePath routeParser location)
