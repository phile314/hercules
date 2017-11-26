module Main exposing (..)

import Maybe
import Material
import Navigation
import UrlParser exposing (parsePath)
import Msg exposing (..)
import Models exposing (..)
import Models.AppEnv exposing (..)
import Update exposing (..)
import View exposing (..)
import Route exposing (..)
import Ports


init : AppEnv -> Navigation.Location -> ( AppModel, Cmd Msg )
init flags location =
    let
        route = Maybe.withDefault Projects (parsePath routeParser location)
        (model, cmd) = setRoute (Just route) (initialModel flags)
    in model ! [ Material.init Mdl
               , Ports.title (routeToTitle route)
               , cmd
               ]


main : Program AppEnv AppModel Msg
main =
    Navigation.programWithFlags (Route.fromLocation >> UnsafeSetRoute)
        { init = init
        , update = update
        , view = view
        , subscriptions = Material.subscriptions Mdl
        }
