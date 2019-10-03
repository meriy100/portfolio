module Page.History exposing (view)

import Contents as Contents exposing (Contents)
import Html as H exposing (Html)
import Html.Attributes as A


type alias Model =
    { contents : Contents
    }


view : Model -> { title : String, content : Html msg }
view model =
    { title = "history"
    , content =
        H.div [ A.class "history__content" ]
            [ H.h1 [ A.class "history_title" ] [ H.text "職務経歴" ]
            , model.contents.history
                |> List.map (.name >> H.text)
                |> H.div []
            ]
    }
