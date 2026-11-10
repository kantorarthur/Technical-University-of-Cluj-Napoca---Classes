module CoinFlipTests exposing (..)

import CoinFlip
import Expect exposing (Expectation)
import Test exposing (..)
import Test.Html.Query as Q
import Test.Html.Selector as S


initialViewHasStartMessage : Test
initialViewHasStartMessage =
    test "initial view contains the start message" <|
        \_ ->
            CoinFlip.view CoinFlip.initModel
                |> Q.fromHtml
                |> Q.has [ S.text "Press the flip button to get started" ]
