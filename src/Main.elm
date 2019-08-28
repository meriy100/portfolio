module Main exposing(main)

import Html as H exposing(Html)
import Html.Attributes as A

main : Html msg
main = H.a [ A.href "https://elm-lang.org/" ] [ H.text "Elm" ]
