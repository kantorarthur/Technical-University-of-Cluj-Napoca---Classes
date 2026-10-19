module Ex358 exposing (..)

import Shape exposing (..)


totalArea : List Shape -> Result ( Int, InvalidShapeError ) Float
totalArea shapes =
    let
        helper index list total =
            case list of
                [] ->
                    Ok total

                shape :: rest ->
                    case safeAreaEnum shape of
                        Ok area ->
                            helper (index + 1) rest (total + area)

                        Err error ->
                            Err ( index, error )
    in
    helper 0 shapes 0
