module Api.Endpoint exposing (decoder, profile, request)

import Api.Host exposing (ApiHost)
import Http as Http
import Json.Decode as Decode exposing (Decoder)
import Url.Builder exposing (QueryParameter)


type Endpoint
    = Endpoint (ApiHost -> String)


decoder : Decoder v -> Decoder v
decoder d =
    Decode.field "data" d


{-| Http.request, except it takes an Endpoint instead of a Url.
-}
request :
    { apiHost : ApiHost
    , body : Http.Body
    , decoder : Decoder r
    , toMsg : Result Http.Error r -> msg
    , headers : List Http.Header
    , method : String
    , url : Endpoint
    }
    -> Cmd msg
request config =
    Http.request
        { body = config.body
        , headers = config.headers
        , method = config.method
        , timeout = Just 1000
        , url = unwrap config.url config.apiHost
        , expect = decoder config.decoder |> Http.expectJson config.toMsg
        , tracker = Nothing
        }


unwrap : Endpoint -> ApiHost -> String
unwrap (Endpoint builder) apiHost =
    builder apiHost


url : List String -> List QueryParameter -> Endpoint
url paths queryParams =
    let
        builder apiHost =
            Url.Builder.crossOrigin (apiHost |> Api.Host.unwrap)
                paths
                queryParams
    in
    Endpoint builder


profile : Endpoint
profile =
    url [ "profile" ] []
