module Page.Profile exposing (view)

import Html as H exposing (Html)
import Html.Attributes as A


view : { title : String, content : Html msg }
view =
    { title = "Profile"
    , content =
        H.div [ A.class "profileLayout" ]
            [ H.div [ A.class "profileFeatured" ]
                [ H.h1 [] [ H.text "meriy100 profile" ]
                , H.address [] [ H.text "kouta@meriy100.com" ]
                ]
            , H.article [ A.class "profileDocument" ]
                [ H.h2 [] [ H.text "Kouta Kariyado - 苅宿 航太" ]
                , H.p [] [ H.text "Web エンジニア" ]
                , H.p [] [ H.text "青山学院大学で情報工学を学び, Web フレームワークの国際化についての研究に従事" ]
                , H.p [] [ H.text "その後, 青山学院大学院でプログラミング教育にまつわる研究を行いながら, 在学中に Rails 開発のインターンや業務委託を複数社経験" ]
                , H.p [] [ H.text "スタートアップテクノロジーに 2018/4に入社し, Rails などを用いた Web サービス開発業務を行う" ]
                , H.p [] [ H.text "2018/12からはマネージャ兼エンジニアとして, チームマネジメント, 採用や社内の評価制度の策定なども行うようになる" ]
                , H.p [] [ H.text "その一環で Scrum Aliance の認定スクラムマスター (CMS) を取得、組織改善に取り組み中。" ]
                , H.p [] [ H.text "また, 副業としてスタートアップのサービス開発を2社, 技術コンサル レビューを1社やらせて頂いています" ]
                ]
            ]
    }