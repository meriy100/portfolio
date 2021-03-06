module Main exposing (main)

import Alert as Alert exposing (Alert)
import Browser as Browser
import Browser.Navigation as Nav exposing (Key)
import Contents exposing (Contents)
import History as History exposing (History)
import Json.Decode as Decode exposing (Decoder)
import Page as Page
import Page.Contact
import Page.History
import Page.Profile
import Page.Works
import Route as Route exposing (Route)
import Session as Session exposing (Session)
import Url as Url exposing (Url)
import Work as Work exposing (Work)


type Msg
    = None
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest


type PageModel
    = Profile Session Contents
    | Works Page.Works.Model
    | History Page.History.Model
    | Contact Session Contents


type alias Model =
    { pageModel : PageModel
    , alerts : List Alert
    }


view : Model -> Browser.Document Msg
view { pageModel, alerts } =
    case pageModel of
        Profile _ _ ->
            Page.view alerts Page.Profile Page.Profile.view

        Works works ->
            Page.view alerts Page.Works (Page.Works.view works)

        Contact _ _ ->
            Page.view alerts Page.Contact Page.Contact.view

        History history ->
            Page.view alerts Page.History (Page.History.view history)


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
                    , Nav.pushUrl (model.pageModel |> toSession |> Session.toNavKey) (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Nav.load href
                    )


changeRouteTo : Maybe Route -> Model -> ( Model, Cmd Msg )
changeRouteTo maybeRoute model =
    let
        session =
            toSession model.pageModel

        contents =
            toContents model.pageModel
    in
    case maybeRoute of
        Nothing ->
            ( { model | pageModel = Profile session contents }, Cmd.none )

        Just Route.Profile ->
            ( { model | pageModel = Profile session contents }, Cmd.none )

        Just Route.History ->
            ( { model | pageModel = History (Page.History.initModel session contents) }, Cmd.none )

        Just Route.Contact ->
            ( { model | pageModel = Contact session contents }, Cmd.none )

        Just Route.Works ->
            ( { model | pageModel = Works (Page.Works.initModel session contents) }, Cmd.none )


toSession : PageModel -> Session
toSession pageModel =
    case pageModel of
        Profile session _ ->
            session

        Contact session _ ->
            session

        History history ->
            Page.History.toSession history

        Works works ->
            Page.Works.toSession works


toContents : PageModel -> Contents
toContents pageModel =
    case pageModel of
        Profile _ contents ->
            contents

        Contact _ contents ->
            contents

        History history ->
            Page.History.toContents history

        Works works ->
            Page.Works.toContents works


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


decodeFlag : Decoder Contents
decodeFlag =
    Decode.field "contents"
        (Decode.field "ja"
            (Decode.map2 Contents
                (Decode.field "history" History.decode)
                (Decode.field "works" (Decode.list Work.decode))
            )
        )


init : Maybe String -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        contents =
            Decode.decodeString decodeFlag (flags |> Maybe.withDefault "")
    in
    case contents of
        Ok c ->
            changeRouteTo (Route.fromUrl url)
                { pageModel = Profile { key = key } c
                , alerts = []
                }

        Err error ->
            changeRouteTo (Route.fromUrl url)
                { pageModel = Profile { key = key } Contents.init
                , alerts = [ { message = Decode.errorToString error } ]
                }


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
