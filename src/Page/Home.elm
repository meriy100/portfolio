module Page.Home exposing (view)

import Browser as Browser
import Html as H
import Html.Attributes as A


view : Browser.Document msg
view =
    { title = "meriy100 portofolio"
    , body =
        [ H.div []
            [ H.h1 [] [ H.text "comming soon" ]
            , H.a [ A.href "/contact" ] [ H.text "contact" ]
            ]
        ]
    }
