module Page.Home exposing (view)

import Html as H exposing (Html)
import Html.Attributes as A


view : { title : String, content : Html msg }
view =
    { title = ""
    , content =
        H.div []
            [ H.div []
                [ H.h1 [] [ H.text "coming soon" ]
                , H.a [ A.href "/contact" ] [ H.text "contact" ]
                ]
            ]
    }
