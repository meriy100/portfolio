module Route exposing (Route(..), fromUrl, linkTo)

import Html as H exposing (Attribute, Html)
import Html.Attributes as A
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)


type Route
    = Profile
    | History
    | Works
    | Contact


linkTo : Route -> List (Attribute msg) -> List (Html msg) -> Html msg
linkTo route attributes =
    (A.href <| routeToString route)
        :: attributes
        |> H.a


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Profile Parser.top
        , Parser.map History (s "history")
        , Parser.map Works (s "works")
        , Parser.map Contact (s "contact")
        ]


fromUrl : Url -> Maybe Route
fromUrl url =
    Parser.parse parser url


routeToString : Route -> String
routeToString page =
    let
        pieces =
            case page of
                Profile ->
                    []

                History ->
                    [ "history" ]

                Works ->
                    [ "works" ]

                Contact ->
                    [ "contact" ]
    in
    "/" ++ String.join "/" pieces
