module Models.History exposing (..)

import Json.Decode as D exposing (Decoder)


type alias History =
    { organization : String
    , products : List Product
    }


type YearMonth
    = YearMonth Int Int


type alias Product =
    { title : String
    , description : List String
    , startAt : YearMonth
    , endAt : Maybe YearMonth
    , technologies : List String
    }


yearMonthDecoder : Decoder YearMonth
yearMonthDecoder =
    D.map2 YearMonth
        (D.field "Year" D.int)
        (D.field "Month" D.int)


productDecoder : Decoder Product
productDecoder =
    D.map5 Product
        (D.field "Title" D.string)
        (D.field "Description" (D.list D.string))
        (D.field "StartMonth" yearMonthDecoder)
        (D.field "EndMonth" (D.nullable yearMonthDecoder))
        (D.field "Technologies" (D.list D.string))


decoder : Decoder History
decoder =
    D.map2 History
        (D.field "Organization" D.string)
        (D.field "Products" (D.list productDecoder))
