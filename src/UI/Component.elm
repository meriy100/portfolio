module UI.Component exposing (..)

import Css as C exposing (Color)
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A
import UI.Theme exposing (theme)
import UI.Variable exposing (..)


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
                , width = px240
                , marginRight = px24
                }

            else
                { backgroundColor = theme.color3
                , width = px216
                , marginRight = px48
                }
    in
    H.li
        [ A.css
            [ C.backgroundColor s.backgroundColor
            , C.color theme.color5
            , C.boxSizing C.borderBox
            , fontSize3
            , C.width s.width
            , C.height px48
            , C.marginRight s.marginRight
            , C.borderLeft px4
            , C.borderColor theme.color4
            , C.borderStyle C.solid
            , boxShadow
            ]
        ]
        [ H.a
            [ A.href path
            , A.css
                [ C.color theme.color5
                , C.boxSizing C.borderBox
                , C.height pct100
                , C.width pct100
                , C.display C.block
                , C.padding4 px12 C.zero px8 px12
                ]
            ]
            [ H.text text ]
        ]


pageTitle : String -> Html msg
pageTitle title =
    H.h1
        [ A.css
            [ fontSize1
            ]
        ]
        [ H.text title ]


cardTitle : String -> String -> Html msg
cardTitle title sub =
    H.div []
        [ H.h2
            [ A.css
                [ fontSize2
                ]
            ]
            [ H.text title ]
        , H.h3
            [ A.css
                [ fontSize3
                ]
            ]
            [ H.text title ]
        ]
