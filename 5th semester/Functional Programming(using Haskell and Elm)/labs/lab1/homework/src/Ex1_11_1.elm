module Ex1_11_1 exposing (main)

import Html exposing (Html, div, text)
import Html.Attributes exposing(style)

gcd: Int -> Int -> Int
gcd a b =
    if b == 0 then a
    else gcd b (modBy b a) 

main : Html msg
main =
    div[]
        [ div[] [ text (String.fromInt(gcd 60 12) ) ]
        
        ,  div[] [text (String.fromInt(gcd 70 12) ) ]
        ,  div[] [text (String.fromInt(gcd 70 25) ) ]
        ,  div[] [text (String.fromInt(gcd 70 50) ) ]
        ]


