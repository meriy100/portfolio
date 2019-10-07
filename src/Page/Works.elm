module Page.Works exposing (Model, initModel, toContents, toSession, view)

import Contents as Contents exposing (Contents)
import Helpers.HtmlHelper as HH
import Html as H exposing (Html)
import Html.Attributes as A
import Session as Session exposing (Session)
import Work as Work exposing (Work)


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


viewWork : Work -> Html msg
viewWork work =
    H.div [ A.class "workPanel" ]
        [ H.a [ A.href work.url, A.target "_blank", A.class "workPanel__image" ]
            [ H.img
                [ A.src (work.imageUrl |> Maybe.withDefault (Work.defaultImageUrl work)) ]
                []
            ]
        , H.div [ A.class "workPanel__body" ]
            [ H.h2 [ A.class "workPanel__title" ] [ H.text work.title ]
            , work.description
                |> String.lines
                |> HH.nl2br
                |> H.p [ A.class "workPanel__description" ]
            ]
        , H.div [ A.class "workPanel__footer" ]
            [ H.a [ A.href work.url, A.target "_blank" ] [ H.text work.url ]
            ]
        ]


view : Model -> { title : String, content : Html msg }
view model =
    { title = "works"
    , content =
        H.div [ A.class "worksLayout" ]
            [ H.h1 [ A.class "worksLayout__title" ] [ H.text "Works" ]
            , model.contents.works
                |> List.map viewWork
                |> H.div [ A.class "worksLayout__contents" ]
            ]
    }
