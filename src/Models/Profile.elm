module Models.Profile exposing (..)

import Json.Decode as Decode exposing (Decoder)


type alias Profile =
    { job : String
    , description : String
    }


decoder : Decoder Profile
decoder =
    Decode.map2 Profile
        (Decode.field "job" Decode.string)
        (Decode.field "description" Decode.string)
