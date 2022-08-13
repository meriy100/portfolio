module UI.Component exposing (..)

import Css as C exposing (Color)
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A
import UI.Theme exposing (theme)


headerList : List (Html msg) -> Html msg
headerList =
    H.ul
        [ A.css
            [ C.displayFlex
            ]
        ]


headerListItem : Bool -> String -> String -> Html msg
headerListItem active path text =
    let
        s =
            if active then
                { backgroundColor = theme.color2
                , width = C.px 240
                , marginRight = C.px (48 - (240 - 214))
                }

            else
                { backgroundColor = theme.color3
                , width = C.px 214
                , marginRight = C.px 48
                }
    in
    H.li
        [ A.css
            [ C.backgroundColor s.backgroundColor
            , C.color theme.color5
            , C.boxSizing C.borderBox
            , C.fontSize <| C.px 24
            , C.width s.width
            , C.height <| C.px 48
            , C.marginRight s.marginRight
            , C.borderLeft (C.px 4)
            , C.borderColor theme.color4
            , C.borderStyle C.solid
            , C.boxShadow4 (C.px 2) (C.px 4) (C.px 4) (C.rgba 0 0 0 0.25)
            ]
        ]
        [ H.a
            [ A.href path
            , A.css
                [ C.color theme.color5
                , C.boxSizing C.borderBox
                , C.height <| C.pct 100
                , C.width <| C.pct 100
                , C.display C.block
                , C.padding4 (C.px 12) C.zero (C.px 8) (C.px 16)
                ]
            ]
            [ H.text text ]
        ]
