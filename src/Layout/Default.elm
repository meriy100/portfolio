module Layout.Default exposing (..)

import Css as C exposing (Color)
import Gen.Route exposing (Route(..))
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A
import UI.Component as Component
import UI.Theme exposing (theme)
import UI.Variable exposing (px16, px24)
import View exposing (View)


layout : Route -> String -> List (Html msg) -> View msg
layout route title body =
    { title = title
    , body =
        [ H.div
            [ A.css
                [ C.backgroundColor theme.color1
                , C.color theme.color4
                , C.padding2 px24 px16
                ]
            ]
            (Component.headerList
                [ Component.headerListItem
                    (route == Home_)
                    "/"
                    "Profile"
                , Component.headerListItem
                    (route == Histories)
                    "/histories"
                    "Histories"
                ]
                :: body
            )
        ]
            |> List.map H.toUnstyled
    }
