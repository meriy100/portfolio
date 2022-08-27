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


compareYearMonth (YearMonth aY aM) (YearMonth bY bM) =
    if aY == bY then
        compare aM bM

    else
        compare aY bY


first : List YearMonth -> Maybe YearMonth
first xs =
    List.sortWith compareYearMonth xs
        |> List.head


last : List (Maybe YearMonth) -> Maybe YearMonth
last xs =
    let
        large x y =
            case compareYearMonth x y of
                LT ->
                    y

                EQ ->
                    x

                GT ->
                    x
    in
    case xs of
        head :: tail ->
            List.foldl
                (\b ->
                    Maybe.andThen
                        (\a -> Maybe.map (large a) b)
                )
                head
                tail

        [] ->
            Nothing
