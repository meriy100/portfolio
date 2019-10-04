module Page.History exposing (Model, initModel, toContents, toSession, view)

import Contents as Contents exposing (Contents)
import History as History exposing (History)
import Html as H exposing (Html)
import Html.Attributes as A
import Session as Session exposing (Session)


type alias Model =
    { session : Session
    , contents : Contents
    }


initModel : Session -> Contents -> Model
initModel session contents =
    { session = session
    , contents = contents
    }


toSession : Model -> Session
toSession model =
    model.session


toContents : Model -> Contents
toContents model =
    model.contents


view : Model -> { title : String, content : Html msg }
view model =
    { title = "history"
    , content =
        H.div [ A.class "history__content" ]
            [ H.h1 [ A.class "history_title" ] [ H.text "職務経歴" ]
            , viewHistory model.contents.history
            ]
    }


viewOrganization organization =
    let
        duplicationText duplication =
            String.fromInt duplication.startedMonth.year
                ++ "年"
                ++ String.fromInt duplication.startedMonth.month
                ++ "月"
    in
    H.div []
        [ H.h2 [] [ H.text organization.name ]
        , H.p [] [ organization.duplication |> duplicationText |> H.text ]
        ]


viewHistory : History -> Html msg
viewHistory history =
    history
        |> List.map viewOrganization
        |> H.div []
