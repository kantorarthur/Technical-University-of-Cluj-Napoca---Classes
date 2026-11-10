module CoinFlipCount exposing (..)

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
    , headsCount : Int
    , tailsCount : Int
    }


initModel : Model
initModel =
    Model Nothing [] 0 0


init : () -> ( Model, Cmd Msg )
init _ =
    ( initModel
    , Cmd.none
    )


type Msg
    = Flip
    | AddFlip CoinSide


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Flip ->
            ( model
            , Random.generate AddFlip coinFlip
            )

        AddFlip coin ->
            ( addCoin coin model
            , Cmd.none
            )


addCoin : CoinSide -> Model -> Model
addCoin coin model =
    let
        newModel =
            { model | currentFlip = Just coin, flips = coin :: model.flips }
    in
    case coin of
        Heads ->
            { newModel | headsCount = model.headsCount + 1 }

        Tails ->
            { newModel | tailsCount = model.tailsCount + 1 }


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
        [ button [ onClick Flip ] [ text "Flip" ]
        , currentFlip
        , div [] [ text ("Heads: " ++ String.fromInt model.headsCount) ]
        , div [] [ text ("Tails: " ++ String.fromInt model.tailsCount) ]
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
