module Pages.Histories exposing (Model, Msg, page)

import Cmd.Extra as CEx
import Css as C exposing (Color)
import Gen.Params.Histories exposing (Params)
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A
import Page
import Request
import Shared
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReplaceMe ->
            model |> CEx.pure



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


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


view : Model -> View Msg
view model =
    { title = "meriy100 職務経歴"
    , body =
        [ H.div
            [ A.css
                [ C.backgroundColor theme.background.default
                , C.color theme.fontColor.default
                ]
            ]
            [ H.div []
                [ H.div []
                    [ H.h1 []
                        [ H.text "職務経歴"
                        ]
                    ]
                ]
            ]
        ]
            |> List.map H.toUnstyled
    }
