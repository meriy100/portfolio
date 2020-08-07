module Page.Profile exposing (view)

import Html as H exposing (Html)
import Html.Attributes as A


view : { title : String, content : Html msg }
view =
    { title = "Profile"
    , content =
        H.div [ A.class "profileLayout" ]
            [ H.div [ A.class "profileFeatured" ]
                [ H.h1 [ A.class "profileFeatured__title" ]
                    [ H.img [ A.class "profileFeatured__icon", A.src "images/icon.jpg" ] []
                    , H.text "meriy100 profile"
                    ]
                , H.address [] [ H.text "kouta@meriy100.com" ]
                ]
            , H.article [ A.class "profileDocument" ]
                [ H.h2 [ A.class "profileDocument__title" ] [ H.text "Kouta Kariyado - 苅宿 航太" ]
                , H.p [] [ H.text "Web エンジニア" ]
                , H.p [] [ H.text "青山学院大学で情報工学を学び, Web フレームワークの国際化についての研究に従事." ]
                , H.p [] [ H.text "その後, 青山学院大学院でプログラミング教育にまつわる研究を行いながら, 在学中に Rails 開発のインターンや業務委託を複数社経験." ]
                , H.p [] [ H.text "スタートアップテクノロジーに 2018/4に入社し, Rails などを用いた Web サービス開発業務を行う." ]
                , H.p [] [ H.text "2018/12からはマネージャ兼エンジニアとして, チームマネジメント, 採用や社内の評価制度の策定なども経験." ]
                , H.p [] [ H.text "その一環で Scrum Aliance の認定スクラムマスター (CMS) を取得、組織改善に取り組む." ]
                , H.p [] [ H.text "退職後フリーランスとしてスタートアップのサービス開発を3社, 技術コンサル レビューを1社に従事." ]
                , H.p [] [ H.text "2020/03 から株式会社 Photosynth でソフトウェアディベロッパーとして入社" ]
                ]
            ]
    }
