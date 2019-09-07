module Page.Top exposing (view)

import Html as H exposing (Html)
import Html.Attributes as A


view : { title : String, content : Html msg }
view =
    { title = ""
    , content =
        H.div [ A.class "home__content" ]
            [ H.h1 [ A.class "home__title" ] [ H.text "coming soon" ]
            ]
    }
