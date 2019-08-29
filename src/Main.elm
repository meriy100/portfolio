module Main exposing (main)

import Browser as Browser
import Browser.Navigation as Nav exposing (Key)
import Page.Home
import Url as Url exposing (Url)


type Msg
    = None
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest


type alias Model =
    { key : Nav.Key
    }


view : Model -> Browser.Document Msg
view model =
    Page.Home.view


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        ChangedUrl url ->
            ( model, Cmd.none )

        ClickedLink urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl model.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Nav.load href
                    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : Maybe String -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( { key = key }, Cmd.none )


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
