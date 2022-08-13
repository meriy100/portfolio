module Layout.Default exposing (..)

import Css as C exposing (Color)
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A
import View exposing (View)


type alias Theme =
    { background : Color
    , fontColor : Color
    }


theme : Theme
theme =
    let
        base =
            C.rgb 56 63 81

        fontColor =
            C.rgb 255 255 255
    in
    { background = base
    , fontColor = fontColor
    }


layout : String -> List (Html msg) -> View msg
layout title body =
    { title = title
    , body =
        [ H.div
            [ A.css
                [ C.backgroundColor theme.background
                , C.color theme.fontColor
                ]
            ]
            (H.div
                []
                [ H.a [ A.href "/" ] [ H.text "Profile" ]
                , H.a [ A.href "/histories" ] [ H.text "Histories" ]
                ]
                :: body
            )
        ]
            |> List.map H.toUnstyled
    }
