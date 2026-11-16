module Ex768 exposing (main)

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


type SortField
    = Population
    | Area
    | Density


type alias Model =
    { status : Status
    , ascending : Bool
    , search : String
    , sortField : SortField
    , regions : List String
    }


type Msg
    = GetCountries
    | GotCountries (Result Http.Error (List Country))
    | SetAscending Bool
    | SearchChanged String
    | SortFieldChanged String
    | ToggleRegion String Bool


allRegions : List String
allRegions =
    [ "Africa", "Americas", "Antarctic", "Asia", "Europe", "Oceania" ]


init : () -> ( Model, Cmd Msg )
init _ =
    ( { status = Initial
      , ascending = False
      , search = ""
      , sortField = Area
      , regions = allRegions
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


toSortField : String -> SortField
toSortField s =
    case s of
        "population" ->
            Population

        "density" ->
            Density

        _ ->
            Area


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

        SearchChanged search ->
            ( { model | search = search }, Cmd.none )

        SortFieldChanged s ->
            ( { model | sortField = toSortField s }, Cmd.none )

        ToggleRegion region True ->
            ( { model | regions = region :: model.regions }, Cmd.none )

        ToggleRegion region False ->
            ( { model | regions = List.filter ((/=) region) model.regions }, Cmd.none )


density : Country -> Float
density country =
    toFloat country.population / country.area


twoDecimals : Float -> String
twoDecimals x =
    String.fromFloat (toFloat (round (x * 100)) / 100)


sortValue : SortField -> Country -> Float
sortValue field country =
    case field of
        Population ->
            toFloat country.population

        Area ->
            country.area

        Density ->
            density country


sortCountries : Model -> List Country -> List Country
sortCountries model countries =
    let
        sorted =
            List.sortBy (sortValue model.sortField) countries
    in
    if model.ascending then
        sorted

    else
        List.reverse sorted


matchesName : String -> Country -> Bool
matchesName search country =
    String.contains (String.toLower search) (String.toLower country.name)


inRegions : List String -> Country -> Bool
inRegions regions country =
    List.member country.region regions


visibleCountries : Model -> List Country -> List Country
visibleCountries model countries =
    let
        byName =
            List.filter (matchesName model.search) countries

        byRegion =
            List.filter (inRegions model.regions) byName
    in
    sortCountries model byRegion


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


viewSearch : String -> Html Msg
viewSearch search =
    div []
        [ input [ type_ "text", placeholder "Search by name", value search, onInput SearchChanged ] []
        ]


viewSortField : SortField -> Html Msg
viewSortField field =
    div []
        [ text "Sort by: "
        , select [ onInput SortFieldChanged ]
            [ option [ value "population", selected (field == Population) ] [ text "Population" ]
            , option [ value "area", selected (field == Area) ] [ text "Area" ]
            , option [ value "density", selected (field == Density) ] [ text "Population density" ]
            ]
        ]


viewAscending : Bool -> Html Msg
viewAscending yes =
    div []
        [ input [ type_ "checkbox", onCheck SetAscending, checked yes ] []
        , text "Ascending"
        ]


viewRegion : List String -> String -> Html Msg
viewRegion regions region =
    label []
        [ input [ type_ "checkbox", onCheck (ToggleRegion region), checked (List.member region regions) ] []
        , text region
        ]


viewRegions : List String -> Html Msg
viewRegions regions =
    div [] (List.map (viewRegion regions) allRegions)


viewCountry : Country -> Html msg
viewCountry country =
    div [ style "border" "solid 1px", style "margin" "2px" ]
        [ p [] [ text ("Name: " ++ country.name) ]
        , p [] [ text ("Region: " ++ country.region) ]
        , p [] [ text ("Area: " ++ String.fromFloat country.area) ]
        , p [] [ text ("Population: " ++ String.fromInt country.population) ]
        , p [] [ text ("Density: " ++ twoDecimals (density country)) ]
        ]


viewSuccess : Model -> List Country -> Html Msg
viewSuccess model countries =
    div []
        ([ h2 [] [ text "ok" ]
         , viewSearch model.search
         , viewSortField model.sortField
         , viewAscending model.ascending
         , viewRegions model.regions
         ]
            ++ List.map viewCountry (visibleCountries model countries)
        )


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }
