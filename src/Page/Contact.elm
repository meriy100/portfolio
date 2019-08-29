module Page.Contact exposing (view)

import Browser as Browser
import Html as H exposing (Html)
import Html.Attributes as A


view : { title : String, content : Html msg }
view =
    { title = "contact"
    , content =
        H.div [ A.class "home" ]
            [ H.div
                [ A.class "home__content" ]
                [ H.h1 [ A.class "home__title" ] [ H.text "coming soon" ]
                , H.a [ A.href "/" ] [ H.text "top" ]
                ]
            ]
    }
