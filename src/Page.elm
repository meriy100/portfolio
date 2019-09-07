module Page exposing (Page(..), view)

import Browser exposing (Document)
import Html as H exposing (Html)
import Html.Attributes as A
import Route as Route exposing (Route)
import Sky as Sky


type Page
    = Top
    | Works
    | History
    | Contact


view : Page -> { title : String, content : Html msg } -> Document msg
view page { title, content } =
    { title = title ++ " - meriy100 portfolio"
    , body = Sky.viewSky :: [ viewHeader page ] ++ [ H.node "main" [] [ content ] ] ++ [ viewFooter ]
    }


linkTitleFromRoute : Route -> String
linkTitleFromRoute route =
    case route of
        Route.Top ->
            "Top"

        Route.Works ->
            "Works"

        Route.History ->
            "History"

        Route.Contact ->
            "Contact"


modifierActive : Page -> Page -> String
modifierActive currentPage page =
    if currentPage == page then
        "header__contentListItem--active"

    else
        ""


viewHeaderContentItem : Route -> String -> Html msg
viewHeaderContentItem route modifier =
    H.li
        (List.map
            A.class
            [ "header__contentListItem", modifier ]
        )
        [ Route.linkTo route
            []
            [ route
                |> linkTitleFromRoute
                |> H.text
            ]
        ]


viewHeader : Page -> Html msg
viewHeader page =
    let
        modifier =
            modifierActive page
    in
    H.nav [ A.class "header" ]
        [ H.ul [ A.class "header__contentList" ]
            [ viewHeaderContentItem Route.Top (modifier Top)
            , viewHeaderContentItem Route.History (modifier Works)
            , viewHeaderContentItem Route.Works (modifier History)
            , viewHeaderContentItem Route.Contact (modifier Contact)
            ]
        ]


viewFooter : Html msg
viewFooter =
    H.div [ A.class "footer" ]
        [ H.a [ A.href "https://meriy100.github.io" ] [ H.text "old portfolio" ]
        ]
