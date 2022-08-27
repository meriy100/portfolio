module Pages.Histories exposing (Model, Msg, page)

import Api.Endpoint
import Api.Host exposing (ApiHost)
import Effect exposing (Effect)
import Gen.Params.Histories exposing (Params)
import Gen.Route
import Html.Styled as H exposing (Html)
import Http
import Json.Decode as D
import Layout.Default as Layout
import Models.History exposing (History)
import Models.YearMonth
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
        , view = view shared
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
                    , Shared.GotHistories histories |> Effect.fromShared
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


viewProduct : Models.History.Product -> Html Msg
viewProduct product =
    UIC.card
        [ UIC.cardHeader [ H.text product.title ] [ H.text (Models.YearMonth.toStringRange product.startAt product.endAt) ]
        , UIC.cardBody
            [ UIC.ul [] <|
                List.map (UIC.li []) <|
                    List.map List.singleton <|
                        List.map H.text <|
                            product.description
            , UIC.cardRightUl <|
                List.map (UIC.li []) <|
                    List.map List.singleton <|
                        List.map H.text <|
                            product.technologies
            ]
        ]


viewHistory : History -> Html Msg
viewHistory history =
    UIC.groupItem
        [ UIC.groupTitle
            [ H.text history.organization ]
            [ H.text "2022/01 ~ 2022/05" ]
        , history.products |> List.map viewProduct |> UIC.cardList
        ]


view : Shared.Model -> Model -> View Msg
view sharedModel model =
    Layout.layout Layout.horizontal
        Gen.Route.Histories
        "meriy100 職務経歴"
        [ H.article []
            [ UIC.pageTitle "職務経歴"
            , sharedModel.maybeHistories
                |> Maybe.withDefault []
                |> List.map viewHistory
                |> UIC.groupList
            ]
        ]
