module Ex1_11_2 exposing (main)

import Html exposing(Html, div, text)  

ack: Int -> Int -> Int
ack n m =
    if n == 0 then m + 1
    else if m == 0 then ack (n-1) 1
    else ack(n-1) ( ack n (m - 1) )


main : Html msg
main =
    div[]
        [ div[] [ text (String.fromInt(ack 1 1) ) ]
        , div[] [ text (String.fromInt(ack 2 3) ) ]
        , div[] [ text (String.fromInt(ack 3 3) ) ]
--Can't use this call, using too much stack        , div[] [ text (String.fromInt(ack 4 1) ) ]
        , div[] [ text (String.fromInt(ack 3 10) ) ]
        ]
