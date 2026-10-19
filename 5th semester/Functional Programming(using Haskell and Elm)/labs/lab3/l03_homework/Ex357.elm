module Ex357 exposing (..)

import Shape exposing (..)


cmpShapes : Shape -> Shape -> Result String Order
cmpShapes left right =
    case ( safeArea left, safeArea right ) of
        ( Err error, _ ) ->
            Err ("Invalid input for left shape: " ++ error)

        ( _, Err error ) ->
            Err ("Invalid input for right shape: " ++ error)

        ( Ok leftArea, Ok rightArea ) ->
            Ok (compare leftArea rightArea)
