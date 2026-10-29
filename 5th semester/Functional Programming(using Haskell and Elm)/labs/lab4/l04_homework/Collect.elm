module Collect exposing (collect)


collect : List (Result err ok) -> Result err (List ok)
collect l =
    List.foldr
        (\r acc ->
            case ( r, acc ) of
                ( Err e, _ ) ->
                    Err e

                ( Ok x, Ok xs ) ->
                    Ok (x :: xs)

                ( Ok _, Err e ) ->
                    Err e
        )
        (Ok [])
        l
