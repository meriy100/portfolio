module UI.Component exposing (..)

import Css as C exposing (Color)
import Css.Media as M
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A
import UI.Theme exposing (theme)
import UI.Variable exposing (..)


ul attrs body =
    H.ul
        (attrs
            ++ [ A.css
                    [ C.listStyle C.disc
                    , C.paddingLeft px16
                    , C.lineHeight px20
                    ]
               ]
        )
        body


li attrs body =
    H.li
        (attrs
            ++ [ A.css
                    [ C.marginBottom px8
                    , C.lastChild
                        [ C.marginBottom C.zero
                        ]
                    ]
               ]
        )
        body


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
            , C.marginBottom px48
            ]
        ]
        [ H.text title ]


groupList items =
    H.div [] items


groupItem body =
    H.div
        [ A.css
            [ C.marginBottom px32
            , C.lastChild
                [ C.marginBottom C.zero
                ]
            ]
        ]
        body


groupTitle title sub =
    H.div
        [ A.css
            [ C.displayFlex
            , C.justifyContent C.spaceBetween
            , C.flexWrap C.wrap
            , C.marginBottom px16
            , C.alignItems C.flexEnd
            ]
        ]
        [ H.h2
            [ A.css
                [ fontSize2
                , C.display C.inline
                ]
            ]
            title
        , H.span
            [ A.css
                [ fontSize3
                ]
            ]
            sub
        ]


cardList cards =
    H.div [] cards


card body =
    H.div
        [ A.css
            [ C.backgroundColor color3
            , C.width px800
            , boxShadow
            , C.marginBottom px16
            , C.padding px8
            , mediaSm
                [ C.width C.auto
                ]
            , mediaMd
                [ C.width px480
                ]
            , C.lastChild
                [ C.marginBottom C.zero
                ]
            ]
        ]
        body


cardHeader title sub =
    H.div
        [ A.css
            [ C.displayFlex
            , C.justifyContent C.spaceBetween
            , C.flexWrap C.wrap
            , C.marginBottom px16
            , C.alignItems C.flexEnd
            ]
        ]
        [ H.h3
            [ A.css
                [ fontSize3
                , C.display C.inline
                ]
            ]
            title
        , H.span
            [ A.css
                [ fontSize4
                , C.width px216
                ]
            ]
            sub
        ]


cardBody body =
    H.div
        [ A.css
            [ C.displayFlex
            , C.justifyContent C.spaceBetween
            , C.flexWrap C.wrap
            ]
        ]
        body


cardRightUl body =
    ul
        [ A.css
            [ C.width px200
            ]
        ]
        body
