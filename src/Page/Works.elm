module Page.Works exposing (Model, initModel, toContents, toSession, view)

import Contents as Contents exposing (Contents)
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
    { title = "works"
    , content =
        H.div [ A.class "worksLayout" ]
            [ H.h1 [ A.class "worksLayout__title" ] [ H.text "Works" ]
            ]
    }
