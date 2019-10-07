module Work exposing (Work, decode)

import Json.Decode as Decode exposing (Decoder)


type WorkType
    = Application
    | RubyGem
    | Library


type alias Work =
    { url : String
    , title : String
    , description : String
    , imageUrl : Maybe String
    , workType : WorkType
    }


stringToWorkType : String -> Maybe WorkType
stringToWorkType str =
    case str of
        "Application" ->
            Just Application

        "Library" ->
            Just Library

        "RubyGems" ->
            Just RubyGem

        _ ->
            Nothing


workTypeHelp : Maybe WorkType -> Decoder WorkType
workTypeHelp workType =
    case workType of
        Just wt ->
            Decode.succeed wt

        Nothing ->
            Decode.fail "invalid workType. parse error."


decodeWorkType : Decoder WorkType
decodeWorkType =
    Decode.string
        |> Decode.andThen (workTypeHelp << stringToWorkType)


decode : Decoder Work
decode =
    Decode.map5 Work
        (Decode.field "url" Decode.string)
        (Decode.field "title" Decode.string)
        (Decode.field "description" Decode.string)
        (Decode.field "imageUrl" (Decode.maybe Decode.string))
        (Decode.field "workType" decodeWorkType)
