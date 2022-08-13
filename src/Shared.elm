module Shared exposing
    ( Flags
    , Model
    , Msg(..)
    , init
    , subscriptions
    , update
    )

import Api.Host exposing (ApiHost)
import Debug
import Json.Decode as Json
import Models.Profile exposing (Profile)
import Request exposing (Request)


type alias Flags =
    Json.Value


type alias Model =
    { apiHost : ApiHost
    , maybeProfile : Maybe Profile
    }


type Msg
    = GotProfile Profile


flagDecoder : Json.Decoder ApiHost
flagDecoder =
    Json.field "apiHost" Api.Host.decoder


init : Request -> Flags -> ( Model, Cmd Msg )
init _ flags =
    case Json.decodeValue flagDecoder flags of
        Ok apiHost ->
            ( { apiHost = apiHost
              , maybeProfile = Nothing
              }
            , Cmd.none
            )

        Err err ->
            let
                _ =
                    Debug.log (Json.errorToString err)
            in
            ( { apiHost = Api.Host.default
              , maybeProfile = Nothing
              }
            , Cmd.none
            )


update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    case msg of
        GotProfile profile ->
            ( { model
                | maybeProfile = Just profile
              }
            , Cmd.none
            )


subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none
