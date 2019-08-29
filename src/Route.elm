module Route exposing (Route(..), fromUrl)

import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)


type Route
    = Home
    | Contact


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map Contact (s "contact")
        ]


fromUrl : Url -> Maybe Route
fromUrl url =
    Parser.parse parser url
