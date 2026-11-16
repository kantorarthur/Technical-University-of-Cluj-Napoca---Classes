module Ex762 exposing (combinations)


combinations : Int -> List a -> List (List a)
combinations n l =
    if n <= 0 then
        [ [] ]

    else
        case l of
            [] ->
                []

            x :: xs ->
                List.map ((::) x) (combinations (n - 1) xs) ++ combinations n xs
