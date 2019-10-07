module Helpers.HtmlHelper exposing (nl2br)

import Html as H exposing (Html)


nl2br : List String -> List (Html msg)
nl2br ss =
    case ss of
        s :: [] ->
            [ H.text s ]

        s :: ss_ ->
            H.text s :: (H.br [] [] :: nl2br ss_)

        [] ->
            []
