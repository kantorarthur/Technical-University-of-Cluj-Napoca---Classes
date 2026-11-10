module CoinFlipMany exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Random


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type CoinSide
    = Heads
    | Tails


type alias Model =
    { currentFlip : Maybe CoinSide
    , flips : List CoinSide
    }


initModel : Model
initModel =
    Model Nothing []


init : () -> ( Model, Cmd Msg )
init _ =
    ( initModel
    , Cmd.none
    )


type Msg
    = Flip Int
    | AddFlips (List CoinSide)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Flip count ->
            ( model
            , Random.generate AddFlips (Random.list count coinFlip)
            )

        AddFlips coins ->
            ( addCoins coins model
            , Cmd.none
            )


addCoins : List CoinSide -> Model -> Model
addCoins coins model =
    let
        allFlips =
            List.reverse coins ++ model.flips
    in
    Model (List.head allFlips) allFlips


coinFlip : Random.Generator CoinSide
coinFlip =
    Random.uniform Heads [ Tails ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    let
        currentFlip =
            model.currentFlip
                |> Maybe.map viewCoin
                |> Maybe.withDefault (text "Press the flip button to get started")

        flips =
            model.flips
                |> List.map coinToString
                |> List.intersperse " "
                |> List.map text
    in
    div []
        [ button [ onClick (Flip 1) ] [ text "Flip" ]
        , button [ onClick (Flip 10) ] [ text "Flip 10" ]
        , button [ onClick (Flip 100) ] [ text "Flip 100" ]
        , currentFlip
        , div [] flips
        ]


coinToString : CoinSide -> String
coinToString coin =
    case coin of
        Heads ->
            "h"

        Tails ->
            "t"


viewCoin : CoinSide -> Html Msg
viewCoin coin =
    div [ style "font-size" "4em" ] [ text (coinToString coin) ]
