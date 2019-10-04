module Alert exposing (Alert, view)

import Html as H exposing (Html)
import Html.Attributes as A


type alias Alert =
    { message : String
    }


viewItem : Alert -> Html msg
viewItem alert =
    H.div [] [ H.text alert.message ]


view : List Alert -> List (Html msg)
view alerts =
    alerts
        |> List.map viewItem
