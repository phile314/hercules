module Components.Navbar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Maybe
import Material.Layout as Layout
import Material.Icon as Icon
import Material.Menu as Menu
import Material.Options as Options
import Msg exposing (..)
import Models exposing (AppModel)
import Components.Breadcrumbs exposing (breadCrumbs)
import Route exposing (..)
import Utils exposing (..)


tabs : AppModel -> List (Html Msg)
tabs model =
    [ {-span [] [ whiteBadge [] [ text (toString model.queueStats.numBuilding) ], text " in progress" ]
    , span [] [ whiteBadge [] [ text (toString model.queueStats.numWaiting) ], text " in queue" ]
    , span [] [ whiteBadge [] [ text (toString model.queueStats.numMachines) ], text " machines" ]
    ,-} text "evaluations"
    , text "builds"
    , text "steps"
    ]


view : AppModel -> List (Html Msg)
view model =
    let
        menuItems = []
    in
        [ Layout.row []
            [ Layout.title
                []
                ([ {-if model.appEnv.logoURL == "" then-}
                    text ""
{-                   else
                    img
                        ([ src model.appEnv.logoURL
                         , alt "Hercules Logo"
                         , class "logo"
                         , style [ ( "height", "37px" ), ( "margin", "5px" ) ]
                         ]
                            ++ (onClickPage GotoRoute Projects)
                        )
                        []-}
                 ]
                    ++ (breadCrumbs model)
                )
            , Layout.spacer
            , Layout.navigation []
                [ Menu.render Mdl
                    [ 1 ]
                    model.mdl
                    [ Menu.ripple
                    , Menu.bottomRight
                    , Menu.icon "account_circle"
                    ]
                    menuItems
                ]
            ]
        ]
