module Enumerate exposing (enumerate)


enumerate : List a -> List ( Int, a )
enumerate l =
    List.foldl (\x ( i, acc ) -> ( i + 1, ( i, x ) :: acc )) ( 0, [] ) l
        |> Tuple.second
        |> List.foldl (::) []
