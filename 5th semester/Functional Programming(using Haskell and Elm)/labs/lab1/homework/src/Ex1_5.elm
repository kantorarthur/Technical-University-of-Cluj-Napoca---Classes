module Ex1_5 exposing (main)

import Html exposing (Html, text)

increment : Int -> Int
increment n =
    n + 1

main: Html msg
main =
    text (String.fromInt(increment 1) )
