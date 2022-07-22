module Pages.Home_ exposing (view)

import Css as C exposing (Color)
import Html
import Html.Styled as H
import Html.Styled.Attributes as A
import View exposing (View)


type alias Theme =
    { background : { default : Color }
    , fontColor : { default : Color }
    }


theme : Theme
theme =
    let
        base =
            C.rgb 56 63 81

        fontColor =
            C.rgb 255 255 255
    in
    { background = { default = base }
    , fontColor = { default = fontColor }
    }


view : View msg
view =
    { title = "meriy100 portfolio"
    , body =
        [ H.div
            [ A.css
                [ C.backgroundColor theme.background.default
                , C.color theme.fontColor.default
                ]
            ]
            [ H.div []
                [ H.img [] []
                , H.div []
                    [ H.h1 []
                        [ H.text "meriy100 profile"
                        ]
                    , H.address [] [ H.text "kouta@meriy100.com" ]
                    ]
                ]
            , H.article []
                [ H.h2 [] [ H.text "Kouta Kariyado - 苅宿 航太" ]
                , H.p [] [ H.text "Web エンジニア" ]
                , H.p [] [ H.text "青山学院大学で情報工学を学び, Web フレームワークの国際化についての研究に従事." ]
                , H.p [] [ H.text "その後, 青山学院大学院でプログラミング教育にまつわる研究を行いながら, 在学中に Rails 開発のインターンや業務委託を複数社経験." ]
                , H.p [] [ H.text "スタートアップテクノロジーに 2018/4に入社し, Rails などを用いた Web サービス開発業務を行う." ]
                , H.p [] [ H.text "2018/12からはマネージャ兼エンジニアとして, チームマネジメント, 採用や社内の評価制度の策定なども経験." ]
                , H.p [] [ H.text "その一環で Scrum Aliance の認定スクラムマスター (CMS) を取得、組織改善に取り組む." ]
                , H.p [] [ H.text "2019/09 からフリーランスとしてスタートアップのサービス開発を2社, 技術コンサル レビューを1社業務に従事し, 2020/03 より Photosynth Inc. にソフトウェアディベロッパーとして入社" ]
                ]
            ]
            |> H.toUnstyled
        ]
    }
