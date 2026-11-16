module Ex765 exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Dec
import Url.Builder


type alias Country =
    { name : String
    , area : Float
    , region : String
    , population : Int
    }


decodeCountry : Dec.Decoder Country
decodeCountry =
    Dec.map4 Country
        (Dec.at [ "name", "common" ] Dec.string)
        (Dec.field "area" Dec.float)
        (Dec.field "region" Dec.string)
        (Dec.field "population" Dec.int)


type Status
    = Initial
    | RequestSent
    | Success (List Country)
    | Error Http.Error


type alias Model =
    { status : Status
    , ascending : Bool
    }


type Msg
    = GetCountries
    | GotCountries (Result Http.Error (List Country))
    | SetAscending Bool


init : () -> ( Model, Cmd Msg )
init _ =
    ( { status = Initial
      , ascending = False
      }
    , Cmd.none
    )


getCountries : Cmd Msg
getCountries =
    let
        params =
            [ Url.Builder.string "fields" "name,area,region,population" ]

        url =
            Url.Builder.crossOrigin "https://restcountries.com" [ "v3.1", "all" ] params
    in
    Http.get
        { url = url
        , expect = Http.expectJson GotCountries (Dec.list decodeCountry)
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetCountries ->
            ( { model | status = RequestSent }, getCountries )

        GotCountries (Ok countries) ->
            ( { model | status = Success countries }, Cmd.none )

        GotCountries (Err err) ->
            ( { model | status = Error err }, Cmd.none )

        SetAscending yes ->
            ( { model | ascending = yes }, Cmd.none )


density : Country -> Float
density country =
    toFloat country.population / country.area


twoDecimals : Float -> String
twoDecimals x =
    String.fromFloat (toFloat (round (x * 100)) / 100)


sortCountries : Model -> List Country -> List Country
sortCountries model countries =
    let
        sorted =
            List.sortBy .area countries
    in
    if model.ascending then
        sorted

    else
        List.reverse sorted


view : Model -> Html Msg
view model =
    case model.status of
        Initial ->
            viewInitial

        RequestSent ->
            div [] [ text "Loading..." ]

        Success countries ->
            viewSuccess model countries

        Error err ->
            viewError err


viewInitial : Html Msg
viewInitial =
    div [] [ button [ onClick GetCountries ] [ text "Get countries" ] ]


viewError : Http.Error -> Html msg
viewError err =
    case err of
        Http.BadUrl url ->
            text ("Bad url: " ++ url)

        Http.Timeout ->
            text "Timeout"

        Http.NetworkError ->
            text "Network error"

        Http.BadStatus code ->
            text ("Bad status: " ++ String.fromInt code)

        Http.BadBody body ->
            text ("Bad body: " ++ body)


viewAscending : Bool -> Html Msg
viewAscending yes =
    div []
        [ input [ type_ "checkbox", onCheck SetAscending, checked yes ] []
        , text "Ascending"
        ]


viewCountry : Country -> Html msg
viewCountry country =
    div [ style "border" "solid 1px", style "margin" "2px" ]
        [ p [] [ text ("Name: " ++ country.name) ]
        , p [] [ text ("Area: " ++ String.fromFloat country.area) ]
        , p [] [ text ("Population: " ++ String.fromInt country.population) ]
        , p [] [ text ("Density: " ++ twoDecimals (density country)) ]
        ]


viewSuccess : Model -> List Country -> Html Msg
viewSuccess model countries =
    div []
        ([ h2 [] [ text "ok" ]
         , viewAscending model.ascending
         ]
            ++ List.map viewCountry (sortCountries model countries)
        )


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }
