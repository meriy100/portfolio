module Layout.Default exposing (..)

import Css as C exposing (Color)
import Gen.Route exposing (Route(..))
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A
import UI.Component as Component
import UI.Theme exposing (theme)
import UI.Variable exposing (pct100, px124, px16, px24, px32)
import View exposing (View)


type alias MainLayout msg =
    List (Html msg) -> Html msg


layout : MainLayout msg -> Route -> String -> List (Html msg) -> View msg
layout l route title body =
    { title = title
    , body =
        [ H.nav
            [ A.css
                [ C.color theme.color4
                , C.position C.fixed
                , C.zIndex (C.int 10)
                , C.paddingTop px24
                , C.paddingLeft px16
                , C.width pct100
                ]
            ]
            [ Component.headerList
                [ Component.headerListItem
                    (route == Home_)
                    "/"
                    "Profile"
                , Component.headerListItem
                    (route == Histories)
                    "/histories"
                    "Histories"
                ]
            ]
        , l body
        ]
            |> List.map H.toUnstyled
    }


main_ : List C.Style -> List (Html msg) -> Html msg
main_ attrs =
    H.main_
        [ A.css <|
            [ C.backgroundColor theme.color1
            , C.color theme.color4
            , C.paddingTop px124
            , C.paddingLeft px32
            , C.paddingRight px32
            , C.position C.relative
            , C.height pct100
            , C.boxSizing C.borderBox
            ]
                ++ attrs
        ]


center : List (Html msg) -> Html msg
center =
    main_
        [ C.displayFlex
        , C.justifyContent C.center
        , C.alignItems C.center
        , C.flexWrap C.wrap
        ]


horizontal : List (Html msg) -> Html msg
horizontal =
    main_
        [ C.displayFlex
        , C.justifyContent C.spaceBetween
        ]
