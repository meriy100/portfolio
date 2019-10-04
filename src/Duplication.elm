module Duplication exposing (Duplication, decode, view)

import Html as H exposing (Attribute, Html)
import Html.Attributes as A
import Json.Decode as Decode exposing (Decoder)
import Regex as Regex exposing (Regex)


type alias Month =
    { year : Int
    , month : Int
    }


type FinishedMonth
    = FinishedMonth Month
    | Current


type alias Duplication =
    { startedMonth : Month
    , finishedMonth : FinishedMonth
    }


view : Duplication -> Html msg
view duplication =
    H.p [ A.class "duplication" ]
        [ H.span [ A.class "duplication__startedMonth" ]
            [ duplication.startedMonth
                |> monthToString
                |> H.text
            ]
        , H.span []
            [ duplication.finishedMonth
                |> finishedMonthToString
                |> H.text
            ]
        ]


monthToString : Month -> String
monthToString month =
    String.fromInt month.year
        ++ "年"
        ++ String.fromInt month.month
        ++ "月"


finishedMonthToString : FinishedMonth -> String
finishedMonthToString finishedMonth =
    case finishedMonth of
        Current ->
            "現在"

        FinishedMonth month ->
            monthToString month


yearRegex : Regex
yearRegex =
    Regex.fromString "(\\d{4})/"
        |> Maybe.withDefault Regex.never


monthRegex : Regex
monthRegex =
    Regex.fromString "/(\\d{2})"
        |> Maybe.withDefault Regex.never


matchToInt : Regex.Match -> Maybe Int
matchToInt { submatches } =
    case submatches of
        [ Just m ] ->
            String.toInt m

        _ ->
            Nothing


parseMonth : String -> Maybe Month
parseMonth str =
    let
        year =
            Regex.find yearRegex str
                |> List.head
                |> Maybe.andThen matchToInt

        month =
            Regex.find monthRegex str
                |> List.head
                |> Maybe.andThen matchToInt
    in
    case ( year, month ) of
        ( Just y, Just m ) ->
            Just { year = y, month = m }

        _ ->
            Nothing


parseFinishedMonth : Maybe String -> Maybe FinishedMonth
parseFinishedMonth str =
    case str of
        Just s ->
            parseMonth s
                |> Maybe.andThen (Maybe.Just << FinishedMonth)

        Nothing ->
            Just Current


monthHelp : Maybe a -> Decoder a
monthHelp month =
    case month of
        Just m ->
            Decode.succeed m

        Nothing ->
            Decode.fail "month parse error"


decode : Decoder Duplication
decode =
    Decode.map2 Duplication
        (Decode.string
            |> Decode.map parseMonth
            |> Decode.andThen monthHelp
            |> Decode.field "startedMonth"
        )
        (Decode.nullable Decode.string
            |> Decode.map parseFinishedMonth
            |> Decode.andThen monthHelp
            |> Decode.field "finishedMonth"
        )
