module Page exposing (view)

import Browser exposing (Document)
import Html as H exposing (Html)


view : { title : String, content : Html msg } -> Document msg
view { title, content } =
    { title = title ++ " - meriy100 portfolio"
    , body = [ content ]
    }
