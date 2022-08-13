module Pages.Home_ exposing (Model, Msg, page)

import Api.Endpoint
import Api.Host exposing (ApiHost)
import Cmd.Extra as CEx
import Css as C exposing (Color)
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A
import Http
import Models.Profile exposing (Profile)
import Page exposing (Page)
import Request exposing (Request)
import Shared
import View exposing (View)


type Msg
    = GotProfile (Result Http.Error Profile)


type alias Model =
    { maybeProfile : Maybe Profile
    }


type alias Theme =
    { background : { default : Color }
    , fontColor : { default : Color }
    }


theme : Theme
theme =
    let
        base =
            C.rgb 56 63 81

        fontColor =
            C.rgb 255 255 255
    in
    { background = { default = base }
    , fontColor = { default = fontColor }
    }


fetchProfile : ApiHost -> Cmd Msg
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


page : Shared.Model -> Request -> Page.With Model Msg
page shared req =
    Page.element
        { init = init shared.apiHost
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


init : ApiHost -> ( Model, Cmd Msg )
init apiHost =
    { maybeProfile = Nothing }
        |> CEx.with (fetchProfile apiHost)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotProfile result ->
            case result of
                Ok portfolio ->
                    { maybeProfile = Just portfolio }
                        |> CEx.pure

                Err err ->
                    { maybeProfile = Nothing }
                        |> CEx.pure


viewDescription : String -> Html Msg
viewDescription description =
    description
        |> String.lines
        |> List.map (H.p [] << List.singleton << H.text)
        |> H.section []


viewJob : String -> Html Msg
viewJob job =
    H.p [] [ H.text job ]


viewMaybeProfile : Maybe Profile -> Html Msg
viewMaybeProfile maybeProfile =
    case maybeProfile of
        Just profile ->
            H.article []
                [ H.h2 [] [ H.text "Kouta Kariyado - 苅宿 航太" ]
                , viewJob profile.job
                , viewDescription profile.description
                ]

        Nothing ->
            H.article [] [ H.text "..." ]


view : Model -> View Msg
view model =
    { title = "meriy100 portfolio"
    , body =
        [ H.div
            [ A.css
                [ C.backgroundColor theme.background.default
                , C.color theme.fontColor.default
                ]
            ]
            [ H.div []
                [ H.img [] []
                , H.div []
                    [ H.h1 []
                        [ H.text "meriy100 profile"
                        ]
                    , H.address [] [ H.text "kouta@meriy100.com" ]
                    ]
                ]
            , model.maybeProfile |> viewMaybeProfile
            ]
            |> H.toUnstyled
        ]
    }
