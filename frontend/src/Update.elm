module Update exposing (..)

import Debug
import Material
import Models exposing (..)
import Msg exposing (..)
import Route exposing (..)
import Pages.Project as Project
import Utils exposing ((=>))

update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case (Debug.log "msg" msg, model.currentPage) of
        (Mdl msg_, _) ->
            Material.update msg_ model


        (GotoRoute route, _) ->
          (model, Route.modifyUrl route)

        (UnsafeSetRoute route, _) ->
            setRoute route model

        (ProjectMsg subMsg, ProjectPage subModel) ->
            let
              ((pageModel, cmd), msgFromPage) = Project.update model.appEnv subMsg subModel
            in
              case msgFromPage of
                (Project.NoOp) ->
                  { model | currentPage = ProjectPage pageModel }
                    => Cmd.map ProjectMsg cmd
                (Project.GotoRoute r) ->
                  model => Route.modifyUrl r


        ( _, _ ) ->
          -- Disregard incoming messages that arrived for the wrong page
          model => Cmd.none


setRoute : Maybe Route -> AppModel -> ( AppModel, Cmd Msg)
setRoute route model =
  case route of

    Nothing -> { model | currentPage = InitPage } => Cmd.none

    Just Projects ->
      let
        ( m, cmd ) = Project.init model.appEnv
      in
        { model | currentPage = ProjectPage m } => Cmd.map ProjectMsg cmd

    Just (Project n) -> model => Cmd.none -- TODO


