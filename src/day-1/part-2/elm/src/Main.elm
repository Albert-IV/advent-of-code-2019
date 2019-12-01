module Main exposing (main)

import Html exposing (..)
import Inputs exposing (inputs)


main =
    let
        moduleFuelCosts =
            getFuelForModules inputs
    in
    div []
        [ h2 [] [ text ("Total Fuel Needed: " ++ String.fromInt moduleFuelCosts) ]
        ]


getFuelForModules : List Int -> Int
getFuelForModules moduleMassList =
    let
        allFuelCosts =
            List.map calculateFuel moduleMassList

        totalFuelCosts =
            List.map getTotalFuelCost allFuelCosts
    in
    List.foldl (+) 0 totalFuelCosts


calculateFuel : Int -> Int
calculateFuel mass =
    floor (toFloat mass / 3) - 2


getTotalFuelCost : Int -> Int
getTotalFuelCost fuel =
    let
        fuelCostList =
            getListOfFuelCosts fuel []
    in
    List.foldl (+) 0 (fuel :: fuelCostList)


getListOfFuelCosts : Int -> List Int -> List Int
getListOfFuelCosts totalFuel fuelCostList =
    let
        fuelCost =
            calculateFuel totalFuel
    in
    if fuelCost > 0 then
        getListOfFuelCosts fuelCost (fuelCost :: fuelCostList)

    else
        fuelCostList
