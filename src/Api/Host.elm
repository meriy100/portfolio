module Api.Host exposing (ApiHost, decoder, default, unwrap)

import Json.Decode as D


type ApiHost
    = ApiHost String


decoder : D.Decoder ApiHost
decoder =
    D.map ApiHost D.string


unwrap : ApiHost -> String
unwrap (ApiHost url) =
    url


default : ApiHost
default =
    ApiHost ""
