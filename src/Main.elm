module Main exposing (main)

import Playground exposing (..)
import Playground3d exposing (..)


main =
    animation view


view time =
    [ star |> rotate (spin 8 time) |> scale 5 ]


star =
    group
        [ smallSpike |> shape3dto2d camera1
        , smallSpike |> shape3dto2d camera1 |> rotate 90
        , smallSpike |> shape3dto2d camera1 |> rotate 180
        , smallSpike |> shape3dto2d camera1 |> rotate 270
        ]


smallSpike =
    group3d
        [ polygon3d orange [ ( -50, 0, 0 ), ( 0, 100, 10 ), ( 50, 0, 0 ) ] |> fade3d 0.9
        , polygon3d blue [ ( 50, 0, 0 ), ( 0, 100, 10 ), ( 0, 0, 20 ) ] |> fade3d 0.9
        , polygon3d green [ ( 0, 0, 20 ), ( 0, 100, 10 ), ( -50, 0, 0 ) ] |> fade3d 0.9
        ]
