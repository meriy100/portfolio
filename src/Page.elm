module Page exposing (view)

import Browser exposing (Document)
import Html as H exposing (Html)
import Html.Attributes as A


view : { title : String, content : Html msg } -> Document msg
view { title, content } =
    { title = title ++ " - meriy100 portfolio"
    , body = viewLayout content
    }


viewLayout : Html msg -> List (Html msg)
viewLayout content =
    content :: [ viewFooter ]


viewFooter : Html msg
viewFooter =
    H.div [ A.class "footer" ]
        [ H.a [ A.href "https://meriy100.github.io" ] [ H.text "old portfolio" ]
        ]
