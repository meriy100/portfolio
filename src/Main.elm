module Main exposing (main)

import Browser as Browser
import Browser.Navigation as Nav exposing (Key)
import Contents exposing (Contents)
import History as History exposing (History)
import Json.Decode as Decode exposing (Decoder)
import Page as Page
import Page.Contact
import Page.History
import Page.Home
import Page.Profile
import Route as Route exposing (Route)
import Session as Session exposing (Session)
import Url as Url exposing (Url)


type Msg
    = None
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest


type Model
    = Top Session Contents
    | Home Session Contents
    | History Session Contents
    | Contact Session Contents


view : Model -> Browser.Document Msg
view model =
    case model of
        Top _ _ ->
            Page.view Page.Top Page.Profile.view

        Contact _ _ ->
            Page.view Page.Contact Page.Contact.view

        History _ contents ->
            Page.view Page.History (Page.History.view { contents = contents })

        Home _ _ ->
            Page.view Page.Works Page.Home.view


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

        contents =
            toContents model
    in
    case maybeRoute of
        Nothing ->
            ( Top session contents, Cmd.none )

        Just Route.Profile ->
            ( Top session contents, Cmd.none )

        Just Route.History ->
            ( History session contents, Cmd.none )

        Just Route.Contact ->
            ( Contact session contents, Cmd.none )

        Just _ ->
            ( Home session contents, Cmd.none )


toSession : Model -> Session
toSession model =
    case model of
        Top session _ ->
            session

        Contact session _ ->
            session

        History session _ ->
            session

        Home session _ ->
            session


toContents : Model -> Contents
toContents model =
    case model of
        Top _ contents ->
            contents

        Contact _ contents ->
            contents

        History _ contents ->
            contents

        Home _ contents ->
            contents


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


decodeFlag : Decoder Contents
decodeFlag =
    Decode.field "contents"
        (Decode.field "ja"
            (Decode.map
                Contents
                (Decode.field "history"
                    History.decode
                )
            )
        )


init : Maybe String -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        contents =
            Decode.decodeString decodeFlag (flags |> Maybe.withDefault "")
                |> Result.withDefault { history = [] }
    in
    changeRouteTo (Route.fromUrl url) (Top { key = key } contents)


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
