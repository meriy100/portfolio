module Page.History exposing (Model, initModel, toContents, toSession, view)

import Contents as Contents exposing (Contents)
import Duplication as Duplication
import History as History exposing (History, Organization, Product)
import Html as H exposing (Html)
import Html.Attributes as A
import Session as Session exposing (Session)


type alias Model =
    { session : Session
    , contents : Contents
    }


initModel : Session -> Contents -> Model
initModel session contents =
    { session = session
    , contents = contents
    }


toSession : Model -> Session
toSession model =
    model.session


toContents : Model -> Contents
toContents model =
    model.contents


view : Model -> { title : String, content : Html msg }
view model =
    { title = "history"
    , content =
        H.div [ A.class "historyLayout" ]
            [ H.h1 [ A.class "historyLayout__title" ] [ H.text "職務経歴" ]
            , model.contents.history
                |> List.map viewOrganization
                |> H.div [ A.class "historyLayout__contents" ]
            ]
    }


nl2br : List String -> List (Html msg)
nl2br ss =
    case ss of
        s :: [] ->
            [ H.text s ]

        s :: ss_ ->
            H.text s :: (H.br [] [] :: nl2br ss_)

        [] ->
            []


viewProduct : Product -> List (Html msg)
viewProduct product =
    [ H.div [ A.class "productsLayout__item" ] [ Duplication.view product.duplication ]
    , H.div [ A.class "productsLayout__item" ]
        [ H.h3 [ A.class "productsLayout__title" ] [ H.text product.title ]
        , product.description
            |> String.lines
            |> nl2br
            |> H.p []
        ]
    , product.technologyUsed
        |> List.map (H.li [ A.class "productsLayout__listItem" ] << List.singleton << H.text)
        |> H.ul [ A.class "productsLayout__item" ]
    , product.members
        |> List.map (H.li [ A.class "productsLayout__listItem" ] << List.singleton << H.text)
        |> H.ul [ A.class "productsLayout__item" ]
    ]


viewProducts : List Product -> Html msg
viewProducts products =
    H.div [ A.class "productsLayout" ]
        ([ H.div [ A.class "productsLayout__header" ] [ H.text "期間" ]
         , H.div [ A.class "productsLayout__header" ] [ H.text "プロジェクト内容" ]
         , H.div [ A.class "productsLayout__header" ] [ H.text "使用技術" ]
         , H.div [ A.class "productsLayout__header" ] [ H.text "規模/メンバー" ]
         ]
            ++ (List.map viewProduct products |> List.concat)
        )


viewOrganization : Organization -> Html msg
viewOrganization organization =
    H.div [ A.class "organization" ]
        [ H.div [ A.class "organization__subject" ]
            [ Duplication.view organization.duplication
            , H.h2 [ A.class "organization__title" ] [ H.text organization.name ]
            ]
        , viewProducts organization.products
        ]
