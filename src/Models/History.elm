module Models.History exposing (..)

import Json.Decode as D exposing (Decoder)
import Models.YearMonth exposing (YearMonth)


type alias History =
    { organization : String
    , products : List Product
    }


type alias Product =
    { title : String
    , description : List String
    , startAt : YearMonth
    , endAt : Maybe YearMonth
    , technologies : List String
    }


productDecoder : Decoder Product
productDecoder =
    D.map5 Product
        (D.field "Title" D.string)
        (D.field "Description" (D.list D.string))
        (D.field "StartMonth" Models.YearMonth.decoder)
        (D.field "EndMonth" (D.nullable Models.YearMonth.decoder))
        (D.field "Technologies" (D.list D.string))


decoder : Decoder History
decoder =
    D.map2 History
        (D.field "Organization" D.string)
        (D.field "Products" (D.list productDecoder))
