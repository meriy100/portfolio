module Pages.Home_ exposing (Model, Msg, page)

import Api.Endpoint
import Api.Host exposing (ApiHost)
import Effect exposing (Effect)
import Gen.Route
import Html.Styled as H exposing (Html)
import Http
import Layout.Default as Layout
import Models.Profile exposing (Profile)
import Page exposing (Page)
import Request exposing (Request)
import Shared
import UI.Component as UIC
import View exposing (View)


type Msg
    = GotProfile (Result Http.Error Profile)


type alias Model =
    {}


fetchProfile : ApiHost -> Effect Msg
fetchProfile apiHost =
    { apiHost = apiHost
    , body = Http.emptyBody
    , decoder = Models.Profile.decoder
    , toMsg = GotProfile
    , headers = []
    , method = "GET"
    , url = Api.Endpoint.profile
    }
        |> Api.Endpoint.request
        |> Effect.fromCmd


page : Shared.Model -> Request.With params -> Page.With Model Msg
page shared req =
    Page.advanced
        { init = init shared.apiHost
        , update = update
        , view = view shared.maybeProfile
        , subscriptions = \_ -> Sub.none
        }


init : ApiHost -> ( Model, Effect Msg )
init apiHost =
    ( {}
    , fetchProfile apiHost
    )


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        GotProfile result ->
            case result of
                Ok profile ->
                    ( {}
                    , Shared.GotProfile profile |> Effect.fromShared
                    )

                Err err ->
                    ( {}
                    , Effect.none
                    )


viewDescription : String -> List (Html Msg)
viewDescription description =
    description
        |> String.lines
        |> List.map (UIC.p [] << List.singleton << H.text)


viewMaybeProfile : Maybe Profile -> Html Msg
viewMaybeProfile maybeProfile =
    case maybeProfile of
        Just profile ->
            UIC.homeDescription
                [ H.text "Kouta Kariyado - 苅宿 航太" ]
                [ H.text profile.job ]
                (viewDescription profile.description)

        Nothing ->
            H.article [] []


view : Maybe Profile -> Model -> View Msg
view maybeProfile model =
    Layout.layout
        Layout.center
        Gen.Route.Home_
        "meriy100 portfolio"
        [ UIC.homeTitle
            [ H.text "meriy100 profile"
            ]
            [ H.address [] [ H.text "kouta@meriy100.com" ] ]
        , maybeProfile |> viewMaybeProfile
        ]
