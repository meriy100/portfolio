module Main exposing (main)

import Browser as Browser
import Browser.Navigation as Navigation exposing (Key)
import Html as H exposing (Html)
import Html.Attributes as A
import Url as Url exposing (Url)


type Msg
    = None
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest


type alias Model =
    {}


view : Model -> Browser.Document Msg
view model =
    { title = "meriy100 portfolio"
    , body =
        [ H.div []
            [ H.h1 [] [ H.text "meriy100 portfolio" ]
            , H.p [ A.class "foo" ] [ H.text "hello" ]
            , H.a [ A.href "https://elm-lang.org/" ] [ H.text "Elm" ]
            , H.div [ A.class "bar" ] []
            ]
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        ClickedLink urlRequest ->
            ( model, Cmd.none )

        ChangedUrl url ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : Maybe String -> Url.Url -> Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    ( {}, Cmd.none )


main : Program (Maybe String) Model Msg
main =
    Browser.application
        { init = init
        , onUrlChange = ChangedUrl
        , onUrlRequest = ClickedLink
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
