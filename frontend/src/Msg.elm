module Msg exposing (..)

import Material
import Http
import Route exposing (..)
import Pages.Project as Project


type Msg
    = Mdl (Material.Msg Msg)
    | GotoRoute Route
    | UnsafeSetRoute (Maybe Route)

    | ProjectMsg Project.Msg
