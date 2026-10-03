module Ex1_11_3 exposing (main)
import Html exposing (Html, div, text)

sudan : Int -> Int -> Int -> Int
sudan n x y =
    if n == 0 then (x + y)
    else if ( (n > 0) && (y == 0) ) then x
    else sudan (n - 1) ( sudan n x (y - 1) )  ( y + sudan n x (y - 1) )

main : Html msg
main = 
    div[]
        [ div[] [ text( String.fromInt(sudan 1 1 1) ) ]
          ,div[] [ text( String.fromInt(sudan 1 2 1) ) ]  
          ,div[] [ text( String.fromInt(sudan 1 2 2) ) ]
          ,div[] [ text( String.fromInt(sudan 2 1 1) ) ]
          ,div[] [ text( String.fromInt(sudan 2 2 2) ) ]
        ]
