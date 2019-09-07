module Sky exposing (Sky, init, viewSky)

import Html as H exposing (Html)
import Html.Attributes as A


type alias Sky =
    List Star


type Color
    = Color1
    | Color2
    | Color3
    | Color4
    | Color5
    | Color6
    | Color7
    | Color8
    | Color9
    | Color10


type alias Star =
    { x : Int
    , y : Int
    , size : Int
    , color : Color
    }


toColor : Star -> String
toColor star =
    case star.color of
        Color1 ->
            "color1"

        Color2 ->
            "color2"

        Color3 ->
            "color3"

        Color4 ->
            "color4"

        Color5 ->
            "color5"

        Color6 ->
            "color6"

        Color7 ->
            "color7"

        Color8 ->
            "color8"

        Color9 ->
            "color9"

        Color10 ->
            "color10"


viewSky =
    H.div [ A.class "sky" ]
        (List.map viewStar init)


viewStar : Star -> Html msg
viewStar star =
    H.div
        [ A.class ("star " ++ toColor star)
        , A.style "left" (String.fromInt star.x ++ "%")
        , A.style "top" (String.fromInt star.y ++ "%")
        , A.style "height" (String.fromInt star.size ++ "px")
        , A.style "width" (String.fromInt star.size ++ "px")
        ]
        []



-- generator
-- $ ruby -e 'size = 250; puts (400.times.map do "    , { x = #{rand(-size..size)}, y = #{rand(-size..size) * -1  +170}, size = #{rand(1..13)}, color = Color#{rand(1..10)} }"end)' | pbcopy


init : Sky
init =
    [ { x = 249, y = 305, size = 1, color = Color3 }
    , { x = -194, y = 49, size = 6, color = Color4 }
    , { x = -139, y = -64, size = 6, color = Color2 }
    , { x = 63, y = 94, size = 12, color = Color3 }
    , { x = -137, y = 74, size = 6, color = Color1 }
    , { x = -49, y = 293, size = 9, color = Color7 }
    , { x = 212, y = 2, size = 9, color = Color3 }
    , { x = -166, y = 160, size = 13, color = Color3 }
    , { x = -88, y = 1, size = 1, color = Color4 }
    , { x = -237, y = 112, size = 8, color = Color1 }
    , { x = -204, y = 344, size = 11, color = Color1 }
    , { x = -199, y = 263, size = 2, color = Color5 }
    , { x = -69, y = 130, size = 5, color = Color10 }
    , { x = -127, y = 417, size = 11, color = Color9 }
    , { x = 37, y = 397, size = 8, color = Color6 }
    , { x = -212, y = 102, size = 6, color = Color5 }
    , { x = 177, y = 113, size = 5, color = Color1 }
    , { x = -75, y = 114, size = 10, color = Color3 }
    , { x = -187, y = 76, size = 8, color = Color10 }
    , { x = 169, y = 251, size = 12, color = Color10 }
    , { x = -78, y = 80, size = 2, color = Color5 }
    , { x = 78, y = 242, size = 2, color = Color8 }
    , { x = -187, y = 130, size = 8, color = Color4 }
    , { x = 140, y = 87, size = 5, color = Color9 }
    , { x = 194, y = 96, size = 1, color = Color10 }
    , { x = -137, y = 306, size = 5, color = Color10 }
    , { x = -97, y = -2, size = 7, color = Color3 }
    , { x = -241, y = 123, size = 7, color = Color7 }
    , { x = -90, y = 122, size = 8, color = Color6 }
    , { x = 105, y = 270, size = 6, color = Color9 }
    , { x = 216, y = 253, size = 13, color = Color1 }
    , { x = -17, y = 153, size = 13, color = Color9 }
    , { x = 178, y = 123, size = 12, color = Color5 }
    , { x = 35, y = -18, size = 1, color = Color10 }
    , { x = -10, y = 370, size = 13, color = Color7 }
    , { x = 159, y = -10, size = 9, color = Color8 }
    , { x = 242, y = 155, size = 7, color = Color10 }
    , { x = -60, y = 103, size = 12, color = Color1 }
    , { x = -224, y = 284, size = 1, color = Color1 }
    , { x = -101, y = -39, size = 11, color = Color3 }
    , { x = -216, y = 117, size = 7, color = Color8 }
    , { x = 250, y = 349, size = 9, color = Color4 }
    , { x = 204, y = 313, size = 11, color = Color2 }
    , { x = 40, y = -7, size = 9, color = Color2 }
    , { x = 64, y = 138, size = 7, color = Color1 }
    , { x = 38, y = 16, size = 5, color = Color2 }
    , { x = -38, y = 409, size = 6, color = Color10 }
    , { x = -150, y = 160, size = 9, color = Color7 }
    , { x = -141, y = 220, size = 11, color = Color6 }
    , { x = 96, y = 88, size = 12, color = Color9 }
    , { x = -164, y = 392, size = 9, color = Color2 }
    , { x = -125, y = 195, size = 7, color = Color7 }
    , { x = 200, y = 85, size = 4, color = Color4 }
    , { x = 32, y = 300, size = 2, color = Color4 }
    , { x = 228, y = 84, size = 3, color = Color9 }
    , { x = 14, y = 229, size = 8, color = Color9 }
    , { x = 183, y = 164, size = 3, color = Color9 }
    , { x = 238, y = 172, size = 1, color = Color5 }
    , { x = 115, y = 1, size = 4, color = Color3 }
    , { x = -37, y = -66, size = 10, color = Color8 }
    , { x = 207, y = 156, size = 13, color = Color5 }
    , { x = -227, y = 273, size = 3, color = Color9 }
    , { x = -155, y = 345, size = 2, color = Color3 }
    , { x = 24, y = 139, size = 2, color = Color9 }
    , { x = 142, y = 130, size = 6, color = Color7 }
    , { x = 135, y = 183, size = 10, color = Color4 }
    , { x = 208, y = 230, size = 9, color = Color3 }
    , { x = -164, y = 373, size = 11, color = Color5 }
    , { x = 25, y = 72, size = 13, color = Color5 }
    , { x = -57, y = 393, size = 12, color = Color3 }
    , { x = 143, y = 348, size = 4, color = Color5 }
    , { x = -211, y = 237, size = 10, color = Color6 }
    , { x = -37, y = 388, size = 5, color = Color7 }
    , { x = -148, y = 86, size = 11, color = Color2 }
    , { x = 96, y = 152, size = 12, color = Color5 }
    , { x = 153, y = -38, size = 8, color = Color9 }
    , { x = 57, y = 45, size = 12, color = Color10 }
    , { x = 4, y = 313, size = 3, color = Color8 }
    , { x = 16, y = 192, size = 5, color = Color1 }
    , { x = 230, y = 193, size = 7, color = Color4 }
    , { x = -181, y = 364, size = 4, color = Color5 }
    , { x = -198, y = -24, size = 9, color = Color7 }
    , { x = 53, y = 417, size = 5, color = Color2 }
    , { x = 235, y = 4, size = 8, color = Color6 }
    , { x = 220, y = 219, size = 12, color = Color6 }
    , { x = -216, y = 230, size = 2, color = Color9 }
    , { x = 41, y = 296, size = 4, color = Color1 }
    , { x = 250, y = 139, size = 4, color = Color5 }
    , { x = 77, y = 155, size = 12, color = Color6 }
    , { x = 1, y = 313, size = 9, color = Color5 }
    , { x = -36, y = 197, size = 3, color = Color8 }
    , { x = 190, y = 301, size = 2, color = Color3 }
    , { x = 192, y = 132, size = 10, color = Color5 }
    , { x = -197, y = 0, size = 3, color = Color1 }
    , { x = 92, y = 291, size = 3, color = Color4 }
    , { x = -70, y = -2, size = 11, color = Color7 }
    , { x = 13, y = 87, size = 11, color = Color7 }
    , { x = -80, y = 157, size = 3, color = Color7 }
    , { x = 131, y = 344, size = 3, color = Color4 }
    , { x = -157, y = 371, size = 5, color = Color8 }
    , { x = 176, y = 357, size = 6, color = Color8 }
    , { x = -239, y = 283, size = 4, color = Color8 }
    , { x = -225, y = 273, size = 12, color = Color7 }
    , { x = -37, y = 224, size = 12, color = Color4 }
    , { x = -80, y = 362, size = 11, color = Color6 }
    , { x = 52, y = 167, size = 1, color = Color8 }
    , { x = -244, y = 284, size = 9, color = Color9 }
    , { x = 119, y = 415, size = 8, color = Color4 }
    , { x = 138, y = -72, size = 12, color = Color3 }
    , { x = -12, y = 290, size = 9, color = Color2 }
    , { x = -1, y = 204, size = 11, color = Color8 }
    , { x = -127, y = 249, size = 11, color = Color9 }
    , { x = 90, y = 120, size = 11, color = Color3 }
    , { x = 162, y = 27, size = 6, color = Color1 }
    , { x = -100, y = 261, size = 11, color = Color4 }
    , { x = -113, y = 360, size = 1, color = Color7 }
    , { x = 68, y = 58, size = 12, color = Color3 }
    , { x = 124, y = 333, size = 9, color = Color8 }
    , { x = 184, y = 99, size = 12, color = Color2 }
    , { x = 126, y = 392, size = 7, color = Color6 }
    , { x = 76, y = 405, size = 11, color = Color9 }
    , { x = 117, y = 234, size = 11, color = Color5 }
    , { x = -72, y = 205, size = 2, color = Color3 }
    , { x = 14, y = 342, size = 11, color = Color10 }
    , { x = 80, y = 105, size = 7, color = Color3 }
    , { x = -200, y = 153, size = 13, color = Color9 }
    , { x = 202, y = 169, size = 11, color = Color2 }
    , { x = 114, y = 355, size = 3, color = Color2 }
    , { x = -105, y = -11, size = 11, color = Color5 }
    , { x = -227, y = 336, size = 5, color = Color5 }
    , { x = -128, y = 18, size = 8, color = Color1 }
    , { x = 110, y = 122, size = 7, color = Color10 }
    , { x = -132, y = 296, size = 12, color = Color4 }
    , { x = -115, y = 248, size = 12, color = Color5 }
    , { x = 141, y = 144, size = 3, color = Color5 }
    , { x = 1, y = 163, size = 1, color = Color3 }
    , { x = 242, y = 98, size = 8, color = Color4 }
    , { x = -148, y = -54, size = 12, color = Color5 }
    , { x = -221, y = 46, size = 10, color = Color7 }
    , { x = -124, y = 354, size = 2, color = Color10 }
    , { x = -59, y = 154, size = 4, color = Color1 }
    , { x = 103, y = 128, size = 2, color = Color10 }
    , { x = 207, y = 81, size = 4, color = Color2 }
    , { x = -19, y = -47, size = 12, color = Color1 }
    , { x = -113, y = 104, size = 4, color = Color1 }
    , { x = 90, y = 223, size = 8, color = Color3 }
    , { x = 106, y = 188, size = 5, color = Color9 }
    , { x = -40, y = 18, size = 7, color = Color9 }
    , { x = 152, y = 144, size = 5, color = Color9 }
    , { x = -250, y = 203, size = 11, color = Color1 }
    , { x = -20, y = 141, size = 6, color = Color7 }
    , { x = -180, y = 259, size = 5, color = Color7 }
    , { x = 149, y = -34, size = 3, color = Color6 }
    , { x = 46, y = 224, size = 1, color = Color7 }
    , { x = 101, y = 212, size = 3, color = Color8 }
    , { x = 233, y = -79, size = 1, color = Color8 }
    , { x = -118, y = 244, size = 5, color = Color10 }
    , { x = -91, y = -65, size = 11, color = Color5 }
    , { x = 18, y = 302, size = 4, color = Color3 }
    , { x = -220, y = 265, size = 5, color = Color7 }
    , { x = 70, y = -28, size = 12, color = Color10 }
    , { x = -80, y = -40, size = 6, color = Color2 }
    , { x = 133, y = 367, size = 2, color = Color8 }
    , { x = -70, y = 341, size = 2, color = Color10 }
    , { x = 139, y = 8, size = 3, color = Color5 }
    , { x = -227, y = 21, size = 13, color = Color7 }
    , { x = -127, y = 370, size = 9, color = Color1 }
    , { x = -130, y = -69, size = 10, color = Color8 }
    , { x = 245, y = 262, size = 4, color = Color1 }
    , { x = 196, y = 93, size = 12, color = Color7 }
    , { x = -27, y = 405, size = 12, color = Color5 }
    , { x = -210, y = -56, size = 5, color = Color7 }
    , { x = -250, y = 416, size = 10, color = Color2 }
    , { x = 119, y = 263, size = 12, color = Color1 }
    , { x = 232, y = 33, size = 7, color = Color3 }
    , { x = -187, y = 302, size = 6, color = Color1 }
    , { x = 90, y = -61, size = 2, color = Color9 }
    , { x = -127, y = 250, size = 9, color = Color3 }
    , { x = 183, y = -80, size = 6, color = Color5 }
    , { x = 24, y = 346, size = 11, color = Color1 }
    , { x = 159, y = 387, size = 3, color = Color3 }
    , { x = 119, y = 177, size = 1, color = Color1 }
    , { x = 189, y = 198, size = 3, color = Color6 }
    , { x = 5, y = 130, size = 6, color = Color4 }
    , { x = 2, y = 341, size = 7, color = Color2 }
    , { x = 46, y = -45, size = 9, color = Color6 }
    , { x = 125, y = 399, size = 11, color = Color6 }
    , { x = 57, y = 60, size = 5, color = Color6 }
    , { x = -185, y = 189, size = 4, color = Color9 }
    , { x = -205, y = 77, size = 8, color = Color10 }
    , { x = 136, y = 165, size = 2, color = Color1 }
    , { x = 3, y = 258, size = 5, color = Color2 }
    , { x = -134, y = 171, size = 5, color = Color8 }
    , { x = -157, y = -19, size = 2, color = Color5 }
    , { x = 66, y = 206, size = 2, color = Color1 }
    , { x = 195, y = 328, size = 13, color = Color3 }
    , { x = 168, y = 226, size = 6, color = Color10 }
    , { x = -162, y = 181, size = 4, color = Color9 }
    , { x = 228, y = 323, size = 2, color = Color10 }
    , { x = 28, y = 129, size = 12, color = Color3 }
    , { x = -142, y = 396, size = 7, color = Color8 }
    , { x = -158, y = 101, size = 10, color = Color2 }
    , { x = -178, y = 32, size = 4, color = Color3 }
    , { x = 8, y = 288, size = 12, color = Color3 }
    , { x = -243, y = 31, size = 7, color = Color4 }
    , { x = -212, y = -7, size = 6, color = Color2 }
    , { x = -236, y = 74, size = 1, color = Color4 }
    , { x = -211, y = 380, size = 7, color = Color1 }
    , { x = 94, y = 220, size = 10, color = Color7 }
    , { x = -140, y = 395, size = 9, color = Color4 }
    , { x = 58, y = 189, size = 12, color = Color9 }
    , { x = -210, y = 61, size = 10, color = Color8 }
    , { x = 14, y = 140, size = 5, color = Color6 }
    , { x = 55, y = 179, size = 10, color = Color3 }
    , { x = 205, y = 80, size = 10, color = Color3 }
    , { x = 209, y = 92, size = 13, color = Color1 }
    , { x = 168, y = 279, size = 13, color = Color1 }
    , { x = -19, y = 387, size = 9, color = Color3 }
    , { x = -10, y = 167, size = 1, color = Color7 }
    , { x = -193, y = 23, size = 13, color = Color5 }
    , { x = -100, y = 100, size = 2, color = Color10 }
    , { x = 36, y = 109, size = 11, color = Color2 }
    , { x = 176, y = 321, size = 6, color = Color5 }
    , { x = -183, y = 254, size = 9, color = Color6 }
    , { x = 47, y = 13, size = 7, color = Color4 }
    , { x = 118, y = 38, size = 7, color = Color9 }
    , { x = -159, y = -71, size = 12, color = Color5 }
    , { x = 61, y = 63, size = 1, color = Color8 }
    , { x = -16, y = 93, size = 5, color = Color10 }
    , { x = -133, y = 276, size = 11, color = Color3 }
    , { x = 26, y = 207, size = 3, color = Color8 }
    , { x = 29, y = 74, size = 9, color = Color6 }
    , { x = -219, y = 293, size = 10, color = Color5 }
    , { x = -208, y = 301, size = 5, color = Color4 }
    , { x = -182, y = 3, size = 12, color = Color4 }
    , { x = -47, y = 112, size = 6, color = Color1 }
    , { x = -50, y = 375, size = 8, color = Color5 }
    , { x = 108, y = -65, size = 8, color = Color5 }
    , { x = -31, y = 403, size = 12, color = Color1 }
    , { x = -159, y = 416, size = 12, color = Color4 }
    , { x = 157, y = 394, size = 9, color = Color5 }
    , { x = 158, y = 347, size = 5, color = Color10 }
    , { x = -190, y = 355, size = 4, color = Color2 }
    , { x = 122, y = 112, size = 5, color = Color4 }
    , { x = -202, y = 316, size = 2, color = Color6 }
    , { x = -165, y = 341, size = 8, color = Color1 }
    , { x = 81, y = 151, size = 12, color = Color10 }
    , { x = 230, y = 306, size = 7, color = Color9 }
    , { x = -115, y = 412, size = 1, color = Color3 }
    , { x = 147, y = 203, size = 7, color = Color7 }
    , { x = 180, y = 336, size = 12, color = Color7 }
    , { x = 119, y = 129, size = 10, color = Color8 }
    , { x = -173, y = 143, size = 9, color = Color7 }
    , { x = 250, y = 301, size = 1, color = Color8 }
    , { x = -88, y = 198, size = 8, color = Color6 }
    , { x = 7, y = 136, size = 9, color = Color2 }
    , { x = -161, y = -80, size = 1, color = Color3 }
    , { x = -69, y = -65, size = 10, color = Color4 }
    , { x = -29, y = 89, size = 2, color = Color9 }
    , { x = 223, y = 384, size = 6, color = Color8 }
    , { x = -79, y = 147, size = 9, color = Color6 }
    , { x = -172, y = 332, size = 4, color = Color9 }
    , { x = 9, y = 7, size = 3, color = Color6 }
    , { x = 204, y = 184, size = 6, color = Color10 }
    , { x = 64, y = 184, size = 10, color = Color8 }
    , { x = -67, y = 319, size = 2, color = Color9 }
    , { x = 21, y = 223, size = 9, color = Color6 }
    , { x = -140, y = -43, size = 1, color = Color3 }
    , { x = -81, y = 191, size = 12, color = Color8 }
    , { x = -196, y = 5, size = 11, color = Color2 }
    , { x = 22, y = 173, size = 4, color = Color6 }
    , { x = 224, y = 235, size = 13, color = Color3 }
    , { x = -92, y = 131, size = 4, color = Color6 }
    , { x = -64, y = 260, size = 13, color = Color1 }
    , { x = 188, y = 262, size = 7, color = Color5 }
    , { x = -2, y = 34, size = 3, color = Color7 }
    , { x = -76, y = 13, size = 3, color = Color8 }
    , { x = 218, y = 280, size = 5, color = Color6 }
    , { x = -69, y = 413, size = 3, color = Color10 }
    , { x = 125, y = 384, size = 7, color = Color1 }
    , { x = 207, y = 77, size = 11, color = Color4 }
    , { x = 75, y = 410, size = 13, color = Color7 }
    , { x = -43, y = -68, size = 5, color = Color6 }
    , { x = -236, y = 140, size = 8, color = Color10 }
    , { x = -207, y = 325, size = 11, color = Color4 }
    , { x = -144, y = 398, size = 6, color = Color2 }
    , { x = -215, y = -71, size = 8, color = Color7 }
    , { x = 228, y = 95, size = 11, color = Color8 }
    , { x = -161, y = 128, size = 8, color = Color10 }
    , { x = -116, y = 362, size = 1, color = Color9 }
    , { x = -82, y = -72, size = 1, color = Color8 }
    , { x = 173, y = 21, size = 3, color = Color6 }
    , { x = -107, y = 352, size = 9, color = Color6 }
    , { x = 101, y = 106, size = 10, color = Color6 }
    , { x = 178, y = 329, size = 4, color = Color6 }
    , { x = 125, y = 0, size = 6, color = Color9 }
    , { x = 95, y = 39, size = 5, color = Color3 }
    , { x = -219, y = 127, size = 7, color = Color4 }
    , { x = 81, y = -70, size = 5, color = Color8 }
    , { x = 53, y = -30, size = 7, color = Color3 }
    , { x = 207, y = 316, size = 11, color = Color9 }
    , { x = 145, y = -31, size = 8, color = Color7 }
    , { x = 43, y = 390, size = 4, color = Color2 }
    , { x = -57, y = 247, size = 12, color = Color7 }
    , { x = 48, y = 178, size = 10, color = Color9 }
    , { x = 43, y = 268, size = 10, color = Color5 }
    , { x = 84, y = 363, size = 7, color = Color1 }
    , { x = -132, y = 411, size = 11, color = Color8 }
    , { x = 179, y = 389, size = 6, color = Color4 }
    , { x = 80, y = 267, size = 6, color = Color8 }
    , { x = 93, y = 342, size = 4, color = Color8 }
    , { x = 53, y = 18, size = 3, color = Color4 }
    , { x = -218, y = -6, size = 12, color = Color8 }
    , { x = -166, y = 319, size = 5, color = Color3 }
    , { x = 167, y = -25, size = 9, color = Color7 }
    , { x = 92, y = 127, size = 7, color = Color8 }
    , { x = -199, y = 2, size = 6, color = Color1 }
    , { x = 59, y = 414, size = 1, color = Color1 }
    , { x = 115, y = 69, size = 10, color = Color7 }
    , { x = 32, y = 222, size = 13, color = Color6 }
    , { x = 146, y = 13, size = 5, color = Color4 }
    , { x = -39, y = 393, size = 12, color = Color1 }
    , { x = -102, y = 81, size = 11, color = Color6 }
    , { x = 133, y = 127, size = 3, color = Color6 }
    , { x = -241, y = 196, size = 10, color = Color2 }
    , { x = -238, y = 181, size = 7, color = Color2 }
    , { x = 154, y = -62, size = 9, color = Color6 }
    , { x = 206, y = -16, size = 7, color = Color4 }
    , { x = 57, y = 296, size = 12, color = Color1 }
    , { x = 130, y = 411, size = 5, color = Color10 }
    , { x = -198, y = -7, size = 7, color = Color8 }
    , { x = 164, y = 35, size = 2, color = Color4 }
    , { x = -4, y = 123, size = 8, color = Color4 }
    , { x = -140, y = 312, size = 1, color = Color6 }
    , { x = 64, y = 279, size = 10, color = Color6 }
    , { x = 27, y = 212, size = 6, color = Color3 }
    , { x = -38, y = 311, size = 2, color = Color7 }
    , { x = 6, y = -64, size = 5, color = Color7 }
    , { x = 44, y = 150, size = 5, color = Color8 }
    , { x = -166, y = 120, size = 1, color = Color8 }
    , { x = 122, y = 237, size = 9, color = Color5 }
    , { x = 134, y = 168, size = 7, color = Color3 }
    , { x = -19, y = -19, size = 5, color = Color5 }
    , { x = 3, y = 239, size = 9, color = Color10 }
    , { x = 80, y = 360, size = 6, color = Color1 }
    , { x = -185, y = 363, size = 13, color = Color6 }
    , { x = -87, y = 169, size = 6, color = Color1 }
    , { x = -207, y = 125, size = 13, color = Color5 }
    , { x = -196, y = 282, size = 1, color = Color5 }
    , { x = 3, y = 418, size = 4, color = Color6 }
    , { x = -201, y = 271, size = 10, color = Color2 }
    , { x = 167, y = 136, size = 3, color = Color1 }
    , { x = 97, y = -66, size = 9, color = Color4 }
    , { x = 168, y = 316, size = 1, color = Color9 }
    , { x = -244, y = 386, size = 9, color = Color6 }
    , { x = 208, y = 318, size = 8, color = Color5 }
    , { x = -227, y = 174, size = 11, color = Color6 }
    , { x = -231, y = 132, size = 13, color = Color6 }
    , { x = 187, y = 283, size = 7, color = Color4 }
    , { x = 229, y = 70, size = 10, color = Color2 }
    , { x = 227, y = 138, size = 9, color = Color2 }
    , { x = 134, y = 403, size = 4, color = Color10 }
    , { x = 241, y = 383, size = 7, color = Color4 }
    , { x = -49, y = -71, size = 1, color = Color2 }
    , { x = 103, y = -48, size = 10, color = Color5 }
    , { x = -136, y = 6, size = 12, color = Color7 }
    , { x = -143, y = 210, size = 12, color = Color6 }
    , { x = 67, y = 107, size = 11, color = Color1 }
    , { x = -199, y = 133, size = 6, color = Color1 }
    , { x = -37, y = 133, size = 13, color = Color9 }
    , { x = 50, y = 352, size = 6, color = Color7 }
    , { x = 224, y = -4, size = 11, color = Color9 }
    , { x = -219, y = 139, size = 3, color = Color8 }
    , { x = 41, y = 39, size = 5, color = Color4 }
    , { x = -166, y = 56, size = 12, color = Color3 }
    , { x = 7, y = 378, size = 2, color = Color1 }
    , { x = 94, y = 69, size = 12, color = Color7 }
    , { x = 79, y = -72, size = 3, color = Color4 }
    , { x = -30, y = 286, size = 5, color = Color3 }
    , { x = -226, y = 208, size = 3, color = Color2 }
    , { x = -45, y = 116, size = 5, color = Color1 }
    , { x = 93, y = 106, size = 6, color = Color9 }
    , { x = -116, y = -78, size = 11, color = Color3 }
    , { x = -19, y = 392, size = 7, color = Color10 }
    , { x = 198, y = -8, size = 9, color = Color1 }
    , { x = -49, y = 153, size = 3, color = Color6 }
    , { x = -12, y = 368, size = 2, color = Color4 }
    , { x = 38, y = 327, size = 9, color = Color4 }
    , { x = 114, y = 365, size = 10, color = Color3 }
    , { x = 211, y = 417, size = 2, color = Color4 }
    , { x = 29, y = 80, size = 11, color = Color7 }
    , { x = -15, y = 114, size = 11, color = Color8 }
    , { x = -83, y = 200, size = 9, color = Color1 }
    , { x = 208, y = 215, size = 9, color = Color10 }
    , { x = -83, y = 210, size = 9, color = Color1 }
    , { x = -225, y = 388, size = 11, color = Color7 }
    , { x = 208, y = 136, size = 2, color = Color4 }
    , { x = -141, y = 281, size = 11, color = Color4 }
    , { x = -240, y = 228, size = 1, color = Color3 }
    , { x = -110, y = 181, size = 12, color = Color1 }
    ]
