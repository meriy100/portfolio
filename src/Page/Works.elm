module Page.Works exposing (Model, initModel, toContents, toSession, view)

import Contents as Contents exposing (Contents)
import Helpers.HtmlHelper as HH
import Html as H exposing (Html)
import Html.Attributes as A
import Session as Session exposing (Session)


type WorkType
    = Application
    | Library


type alias Work =
    { url : String
    , title : String
    , description : String
    , imageUrl : Maybe String
    , workType : WorkType
    }


type alias Model =
    { session : Session
    , contents : Contents
    , works : List Work
    }


initialWorks : List Work
initialWorks =
    { url = "https://bfide.meriy100.com"
    , title = "brain f*ck ide"
    , description = "brain f*ck editor (still debug)"
    , imageUrl = Just "images/bfide.png"
    , workType = Application
    }
        |> List.repeat 3


initModel : Session -> Contents -> Model
initModel session contents =
    { session = session
    , contents = contents
    , works = initialWorks
    }


toSession : Model -> Session
toSession model =
    model.session


toContents : Model -> Contents
toContents model =
    model.contents


noImage : Html msg
noImage =
    H.div [ A.class "noImage" ] [ H.text "No Image" ]


viewWork : Work -> Html msg
viewWork work =
    H.div [ A.class "workPanel" ]
        [ H.a [ A.href work.url, A.target "_blank", A.class "workPanel__image" ]
            [ work.imageUrl
                |> Maybe.andThen (\iu -> H.img [ A.src iu ] [] |> Just)
                |> Maybe.withDefault noImage
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
            , model.works
                |> List.map viewWork
                |> H.div [ A.class "worksLayout__contents" ]
            ]
    }
