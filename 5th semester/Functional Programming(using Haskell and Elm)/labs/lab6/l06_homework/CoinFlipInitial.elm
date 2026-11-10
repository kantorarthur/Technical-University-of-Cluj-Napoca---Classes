module CoinFlipInitial exposing (..)

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
    List CoinSide


init : () -> ( Model, Cmd Msg )
init _ =
    ( []
    , Random.generate AddFlip coinFlip
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
            ( coin :: model
            , Cmd.none
            )


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
            case model of
                coin :: _ ->
                    viewCoin coin

                [] ->
                    text ""

        flips =
            model
                |> List.map coinToString
                |> List.intersperse " "
                |> List.map text
    in
    div []
        [ button [ onClick Flip ] [ text "Flip" ]
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
