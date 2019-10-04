module History exposing (History, Organization, Product, decode)

import Duplication as Duplication exposing (Duplication)
import Json.Decode as Decode exposing (Decoder)


type alias Product =
    { duplication : Duplication
    , title : String
    , description : String
    , technologyUsed : List String
    , members : List String
    }


type alias Organization =
    { name : String
    , duplication : Duplication
    , products : List Product
    }


type alias History =
    List Organization


decodeProduct : Decoder Product
decodeProduct =
    Decode.map5 Product
        (Decode.field "duplication" Duplication.decode)
        (Decode.field "title" Decode.string)
        (Decode.field "description" Decode.string)
        (Decode.field "technologyUsed" (Decode.list Decode.string))
        (Decode.field "members" (Decode.list Decode.string))


decode : Decoder History
decode =
    Decode.field "organizations"
        (Decode.list
            (Decode.map3 Organization
                (Decode.field "name" Decode.string)
                (Decode.field "duplication" Duplication.decode)
                (Decode.field "products" (Decode.list decodeProduct))
            )
        )
