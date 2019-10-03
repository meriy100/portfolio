module History exposing (Organization)

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
    , technology_used : List String
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
            case Regex.find (Regex.fromString "(\\d{4})/") str |> List.head of
                Just match ->
                    case match.submatches of
                        [ [ Just year ] ] ->
                            String.toInt year

                        _ ->
                            Nothing

                _ ->
                    Nothing

        month =
            case Regex.find (Regex.fromString "(/\\d{2})") str |> List.head of
                Just match ->
                    case match.submatches of
                        [ [ Just month ] ] ->
                            String.toInt month

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


decode : Decoder History



--decode =
--    Decode.list (Decode.map4 Organization Decode.string ())
