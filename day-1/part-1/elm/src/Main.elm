module Main exposing (main)

import Html exposing (..)
import Inputs exposing (inputs)


main =
    div []
        [ h1 [] [ text "Answer:" ]
        , h3 [] [ text (String.fromInt calculateTotalFuel) ]
        ]


calculateTotalFuel : Int
calculateTotalFuel =
    let
        allFuelCosts =
            List.map calculateFuel inputs
    in
    List.foldl (+) 0 allFuelCosts


calculateFuel : Int -> Int
calculateFuel weight =
    floor (toFloat weight / 3) - 2
