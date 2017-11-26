module Models exposing (..)

import Material
import Maybe
import Models.AppEnv exposing (..)
import Date
import Pages.Project
import Route exposing (Route)

{-| Main type representing model of current page
-}
type Page
    = InitPage
    | ProjectPage Pages.Project.Model

type alias AppModel =
    { mdl : Material.Model
    , currentPage : Page
    , appEnv: AppEnv
    }


initialModel : AppEnv -> AppModel
initialModel env =
        { appEnv = env
        , mdl = Material.model
        , currentPage = InitPage
        }
