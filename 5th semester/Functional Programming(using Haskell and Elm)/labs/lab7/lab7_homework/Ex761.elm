module Ex761 exposing (tails)


{-| Returns all the ends (tails) of a list.

    tails [1, 2, 3] --> [[1, 2, 3], [2, 3], [3], []]
-}
tails : List a -> List (List a)
tails l =
    case l of
        [] ->
            [ [] ]

        x :: xs ->
            (x :: xs) :: tails xs
