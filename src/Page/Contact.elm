module Page.Contact exposing (view)

import Browser as Browser
import Html as H
import Html.Attributes as A


view : Browser.Document msg
view =
    { title = "contact - meriy100 portfolio"
    , body =
        [ H.div []
            [ H.h1 [] [ H.text "coming soon" ]
            , H.a [ A.href "/" ] [ H.text "top" ]
            ]
        ]
    }
