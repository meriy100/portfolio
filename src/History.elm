module History exposing (History, decode)

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


parseMonth : String -> Maybe Month
parseMonth str =
    let
        year =
            case Regex.find (Regex.fromString "(\\d{4})/" |> Maybe.withDefault Regex.never) str |> List.head of
                Just match ->
                    case match.submatches of
                        [ Just y ] ->
                            String.toInt y

                        _ ->
                            Nothing

                _ ->
                    Nothing

        month =
            case Regex.find (Regex.fromString "/(\\d{2})" |> Maybe.withDefault Regex.never) str |> List.head of
                Just match ->
                    case match.submatches of
                        [ Just m ] ->
                            String.toInt m

                        _ ->
                            Nothing

                _ ->
                    Nothing
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


decodeDuplication : Decoder Duplication
decodeDuplication =
    Decode.map2 Duplication
        (Decode.field "startedMonth" (Decode.map parseMonth Decode.string |> Decode.andThen monthHelp))
        (Decode.field "finishedMonth" (Decode.map parseFinishedMonth (Decode.nullable Decode.string) |> Decode.andThen monthHelp))


decodeProduct : Decoder Product
decodeProduct =
    Decode.map5 Product
        (Decode.field "duplication" decodeDuplication)
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
                (Decode.field "duplication" decodeDuplication)
                (Decode.field "products" (Decode.list decodeProduct))
            )
        )
