module Shared exposing
    ( Flags
    , Model
    , Msg
    , init
    , subscriptions
    , update
    )

import Api.Host exposing (ApiHost)
import Debug
import Json.Decode as Json
import Request exposing (Request)


type alias Flags =
    Json.Value


type alias Model =
    { apiHost : ApiHost
    }


type Msg
    = NoOp


flagDecoder : Json.Decoder Model
flagDecoder =
    Json.map Model
        (Json.field "apiHost" Api.Host.decoder)


init : Request -> Flags -> ( Model, Cmd Msg )
init _ flags =
    case Json.decodeValue flagDecoder flags of
        Ok model ->
            ( model, Cmd.none )

        Err err ->
            let
                _ =
                    Debug.log (Json.errorToString err)
            in
            ( { apiHost = Api.Host.default }, Cmd.none )


update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none
