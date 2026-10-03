module Ex1_8 exposing (main)

import Html exposing (Html, text)

boolToAnswer b = 
    if b then "True"
    else "False"

main: Html msg
main =
    text (boolToAnswer (1 > 2) ) 
