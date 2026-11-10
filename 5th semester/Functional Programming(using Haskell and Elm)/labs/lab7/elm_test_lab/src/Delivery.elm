module Delivery exposing (..)


type DeliveryStatus
    = Processing
    | Shipped String
    | Delivered


getTracking : DeliveryStatus -> String
getTracking status =
    case status of
        Shipped numar ->
            numar

        _ ->
            "No tracking available"
