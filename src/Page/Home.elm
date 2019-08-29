module Page.Home exposing (view)

import Browser as Browser
import Html as H
import Html.Attributes as A


view : Browser.Document msg
view =
    { title = "meriy100 portfolio"
    , body =
        [ H.div []
            [ H.h1 [] [ H.text "coming soon" ]
            , H.a [ A.href "https://meriy100.github.io" ] [ H.text "old portfolio" ]
            ]
        , H.div []
            [ H.a [ A.href "/contact" ] [ H.text "contact" ]
            ]
        ]
    }
