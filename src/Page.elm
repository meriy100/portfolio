module Page exposing (view)

import Browser exposing (Document)
import Html as H exposing (Html)
import Html.Attributes as A
import Route as Route exposing (Route)


view : { title : String, content : Html msg } -> Document msg
view { title, content } =
    { title = title ++ " - meriy100 portfolio"
    , body = viewLayout content
    }


viewLayout : Html msg -> List (Html msg)
viewLayout content =
    viewSky :: [ viewHeader ] ++ [ content ] ++ [ viewFooter ]


linkTitleFromRoute route =
    case route of
        Route.Home ->
            "Home"

        Route.Works ->
            "Works"

        Route.History ->
            "History"

        Route.Contact ->
            "Contact"


viewHeaderContentItem : Route -> Html msg
viewHeaderContentItem route =
    H.li [ A.class "header__contentListItem" ]
        [ Route.linkTo route
            []
            [ route
                |> linkTitleFromRoute
                |> H.text
            ]
        ]


viewHeader : Html msg
viewHeader =
    H.nav [ A.class "header" ]
        [ H.ul [ A.class "header__contentList" ]
            [ viewHeaderContentItem Route.Home
            , viewHeaderContentItem Route.History
            , viewHeaderContentItem Route.Works
            , viewHeaderContentItem Route.Contact
            ]
        ]


viewFooter : Html msg
viewFooter =
    H.div [ A.class "footer" ]
        [ H.a [ A.href "https://meriy100.github.io" ] [ H.text "old portfolio" ]
        ]


type alias Star =
    { x : Int
    , y : Int
    , size : Int
    }


viewSky =
    H.div [ A.class "sky" ]
        [ viewStar { x = 70, y = 70, size = 13 }
        , viewStar { x = 50, y = 44, size = 23 }
        ]


viewStar : Star -> Html msg
viewStar star =
    H.div
        [ A.class "star"
        , A.style "left" (String.fromInt star.x ++ "%")
        , A.style "top" (String.fromInt (170 - star.y) ++ "%")
        , A.style "height" (String.fromInt star.size ++ "px")
        , A.style "width" (String.fromInt star.size ++ "px")
        ]
        []
