module PartitionTests exposing (suite)

import Expect
import Fuzz exposing (int, list)
import Lists
import Test exposing (Test, describe, fuzz2)


suite : Test
suite =
    describe "Lists.partition"
        [ fuzz2 int (list int) "keeps the total number of elements" <|
            \pivot numbers ->
                let
                    ( smaller, larger ) =
                        Lists.partition pivot numbers
                in
                Expect.equal
                    (List.length numbers)
                    (List.length smaller + List.length larger)
        , fuzz2 int (list int) "keeps exactly the same elements" <|
            \pivot numbers ->
                let
                    ( smaller, larger ) =
                        Lists.partition pivot numbers
                in
                Expect.equal
                    (List.sort numbers)
                    (List.sort (smaller ++ larger))
        , fuzz2 int (list int) "first list only has elements smaller than the pivot" <|
            \pivot numbers ->
                let
                    ( smaller, _ ) =
                        Lists.partition pivot numbers
                in
                smaller
                    |> List.all (\number -> number < pivot)
                    |> Expect.equal True
        , fuzz2 int (list int) "second list only has elements not smaller than the pivot" <|
            \pivot numbers ->
                let
                    ( _, larger ) =
                        Lists.partition pivot numbers
                in
                larger
                    |> List.all (\number -> number >= pivot)
                    |> Expect.equal True
        ]


module CreditCard exposing
    ( CardNumber
    , CreditCard
    , Date
    , InvalidCard(..)
    , Issuer(..)
    , determineIssuer
    , isCardNumberValid
    , parseCreditCard
    )


type alias Date =
    { month : Int, year : Int }


type alias CardNumber =
    List Int


type Issuer
    = Visa
    | Mastercard


type alias CreditCard =
    { issuer : Issuer
    , number : CardNumber
    , expiration : Date
    }


type InvalidCard
    = InvalidFormat
    | InvalidExpiryDate
    | UnknownIssuer
    | FailedLuhnCheck


parseCreditCard : String -> Result InvalidCard CreditCard
parseCreditCard input =
    case String.split ":" input of
        [ numberText, dateText ] ->
            parseCardNumber numberText
                |> Result.andThen (buildCard dateText)

        _ ->
            Err InvalidFormat


buildCard : String -> CardNumber -> Result InvalidCard CreditCard
buildCard dateText number =
    Result.map2
        (\issuer date -> CreditCard issuer number date)
        (determineIssuer number)
        (parseDate dateText)


parseCardNumber : String -> Result InvalidCard CardNumber
parseCardNumber text =
    if String.length text /= 16 || not (String.all Char.isDigit text) then
        Err InvalidFormat

    else
        let
            digits =
                text
                    |> String.toList
                    |> List.filterMap (String.fromChar >> String.toInt)
        in
        if isCardNumberValid digits then
            Ok digits

        else
            Err FailedLuhnCheck


parseDate : String -> Result InvalidCard Date
parseDate text =
    case String.split "/" text of
        [ monthText, yearText ] ->
            if isTwoDigits monthText && isTwoDigits yearText then
                toDate monthText yearText

            else
                Err InvalidExpiryDate

        _ ->
            Err InvalidFormat


toDate : String -> String -> Result InvalidCard Date
toDate monthText yearText =
    case ( String.toInt monthText, String.toInt yearText ) of
        ( Just month, Just year ) ->
            if month >= 1 && month <= 12 then
                Ok { month = month, year = 2000 + year }

            else
                Err InvalidExpiryDate

        _ ->
            Err InvalidExpiryDate


isTwoDigits : String -> Bool
isTwoDigits text =
    String.length text == 2 && String.all Char.isDigit text


determineIssuer : CardNumber -> Result InvalidCard Issuer
determineIssuer number =
    let
        firstTwo =
            prefixValue 2 number

        firstFour =
            prefixValue 4 number

        isVisa =
            List.head number == Just 4

        isMastercard =
            (firstFour >= 2221 && firstFour <= 2720)
                || (firstTwo >= 51 && firstTwo <= 55)
    in
    if isVisa then
        Ok Visa

    else if isMastercard then
        Ok Mastercard

    else
        Err UnknownIssuer


prefixValue : Int -> List Int -> Int
prefixValue count digits =
    digits
        |> List.take count
        |> List.foldl (\digit total -> total * 10 + digit) 0


isCardNumberValid : CardNumber -> Bool
isCardNumberValid digits =
    digits
        |> List.reverse
        |> List.indexedMap luhnDigit
        |> List.sum
        |> (\total -> modBy 10 total == 0)


luhnDigit : Int -> Int -> Int
luhnDigit index digit =
    if modBy 2 index == 1 then
        doubleDigit digit

    else
        digit


doubleDigit : Int -> Int
doubleDigit digit =
    let
        doubled =
            digit * 2
    in
    if doubled > 9 then
        doubled - 9

    else
        doubled

module ColoredSphere exposing (Color(..), ColoredSphere, Point, moveUpdate)


type alias Point =
    { x : Int, y : Int, z : Int }


type Color
    = Red
    | Green
    | Blue


type alias ColoredSphere =
    { center : Point, color : Color, radius : Int }


moveUpdate : ColoredSphere -> Int -> Int -> ColoredSphere
moveUpdate sphere dx dy =
    let
        center =
            sphere.center

        movedCenter =
            { center | x = center.x + dx, y = center.y + dy }
    in
    { sphere | center = movedCenter }

