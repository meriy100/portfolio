module Main exposing (main)

import Browser as Browser
import Browser.Navigation as Nav exposing (Key)
import Page as Page
import Page.Contact
import Page.Home
import Route as Route exposing (Route)
import Session as Session exposing (Session)
import Url as Url exposing (Url)


type Msg
    = None
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest


type Model
    = Home Session
    | Contact Session


view : Model -> Browser.Document Msg
view model =
    case model of
        Home _ ->
            Page.view Page.Home Page.Home.view

        Contact _ ->
            Page.view Page.Contact Page.Contact.view


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        ChangedUrl url ->
            changeRouteTo (Route.fromUrl url) model

        ClickedLink urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl (model |> toSession |> Session.toNavKey) (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Nav.load href
                    )


changeRouteTo : Maybe Route -> Model -> ( Model, Cmd Msg )
changeRouteTo maybeRoute model =
    let
        session =
            toSession model
    in
    case maybeRoute of
        Nothing ->
            ( Home session, Cmd.none )

        Just Route.Home ->
            ( Home session, Cmd.none )

        Just Route.Contact ->
            ( Contact session, Cmd.none )

        Just _ ->
            ( Home session, Cmd.none )


toSession : Model -> Session
toSession model =
    case model of
        Home session ->
            session

        Contact session ->
            session


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : Maybe String -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    changeRouteTo (Route.fromUrl url) (Home { key = key })


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
