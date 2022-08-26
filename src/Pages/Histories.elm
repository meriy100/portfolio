module Pages.Histories exposing (Model, Msg, page)

import Api.Endpoint
import Api.Host exposing (ApiHost)
import Cmd.Extra as CEx
import Css as C exposing (Color)
import Effect exposing (Effect)
import Gen.Params.Histories exposing (Params)
import Gen.Route
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A
import Http
import Json.Decode as D
import Layout.Default as Layout
import Models.History exposing (History)
import Page
import Request
import Shared
import UI.Component as UIC
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.advanced
        { init = init shared.apiHost
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    {}


init : ApiHost -> ( Model, Effect Msg )
init apiHost =
    ( {}
    , fetchHistories apiHost
    )



-- UPDATE


type Msg
    = GotHistories (Result Http.Error (List History))


fetchHistories : ApiHost -> Effect Msg
fetchHistories apiHost =
    { apiHost = apiHost
    , body = Http.emptyBody
    , decoder = Models.History.decoder |> D.list
    , toMsg = GotHistories
    , headers = []
    , method = "GET"
    , url = Api.Endpoint.histories
    }
        |> Api.Endpoint.request
        |> Effect.fromCmd


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        GotHistories result ->
            case result of
                Ok histories ->
                    ( {}
                    , Effect.none
                    )

                Err err ->
                    let
                        _ =
                            Debug.log "fetchHistory error" err
                    in
                    ( {}
                    , Effect.none
                    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


type alias Theme =
    { background : { default : Color }
    , fontColor : { default : Color }
    }


view : Model -> View Msg
view model =
    Layout.layout Layout.horizontal
        Gen.Route.Histories
        "meriy100 職務経歴"
        [ H.article []
            [ UIC.pageTitle "職務経歴"
            ]
        ]
