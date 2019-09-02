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
    viewHeader :: [ content ] ++ [ viewFooter ]


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
