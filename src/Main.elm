module Main exposing (main)

import Playground exposing (..)


main =
    picture view


view =
    [ tree
    , star |> moveUp 70 |> scale 0.75
    , overlay
    ]


star =
    group
        [ smallSpike orange |> rotate 45
        , smallSpike orange |> rotate 135
        , smallSpike orange |> rotate 225
        , smallSpike orange |> rotate 315
        , largeSpike yellow
        , largeSpike yellow |> rotate 90
        , largeSpike yellow |> rotate 180
        , largeSpike yellow |> rotate 270
        ]


smallSpike color =
    polygon color [ ( -5, 0 ), ( 0, 30 ), ( 5, 0 ) ]


largeSpike color =
    polygon color [ ( -5, 0 ), ( 0, 50 ), ( 5, 0 ) ]


tree =
    group
        [ rectangle brown 10 20 |> moveDown 125
        , polygon darkGreen [ ( -20, 0 ), ( 0, 40 ), ( 20, 0 ) ]
        , polygon darkGreen [ ( -40, 0 ), ( 0, 60 ), ( 40, 0 ) ] |> moveDown 40
        , polygon darkGreen [ ( -70, 0 ), ( 0, 70 ), ( 70, 0 ) ] |> moveDown 80
        , polygon darkGreen [ ( -100, 0 ), ( 0, 75 ), ( 100, 0 ) ] |> moveDown 120
        ]


overlay =
    group
        [ rectangle lightRed 200 400 |> fade 0.1 |> moveLeft 100
        , rectangle lightBlue 200 400 |> fade 0.1 |> moveRight 100
        ]
