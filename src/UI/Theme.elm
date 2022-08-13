module UI.Theme exposing (..)

import Css as C exposing (Color)


type alias Theme =
    { color1 : Color
    , color2 : Color
    , color3 : Color
    , color4 : Color
    , color5 : Color
    }


theme : Theme
theme =
    let
        background =
            C.rgb 56 63 81

        color2 =
            C.rgb 60 79 118

        baseColor =
            C.rgb 75 102 152

        subFontColor =
            C.rgb 221 219 241

        fontColor =
            C.rgb 255 255 255
    in
    { color1 = background
    , color2 = color2
    , color3 = baseColor
    , color4 = fontColor
    , color5 = subFontColor
    }
