module Main exposing (main)

import Html as H exposing (Html)
import Html.Attributes as A


main : Html msg
main =
    H.div []
        [ H.p [ A.class "foo" ] [ H.text "hello" ]
        , H.a [ A.href "https://elm-lang.org/" ] [ H.text "Elm" ]
        ]
