module Models.YearMonth exposing (..)

import Json.Decode as D exposing (Decoder)


type alias Year =
    Int


type alias Month =
    Int


type YearMonth
    = YearMonth Year Month


decoder : Decoder YearMonth
decoder =
    D.map2 YearMonth
        (D.field "Year" D.int)
        (D.field "Month" D.int)


toString : YearMonth -> String
toString (YearMonth year month) =
    (year |> String.fromInt)
        ++ "/"
        ++ (month |> monthToString)


monthToString : Month -> String
monthToString month =
    if month < 10 then
        "0" ++ (month |> String.fromInt)

    else
        month |> String.fromInt


toStringRange : YearMonth -> Maybe YearMonth -> String
toStringRange start end =
    toString start
        ++ " ~ "
        ++ (end
                |> Maybe.andThen (toString >> Just)
                |> Maybe.withDefault ""
           )
