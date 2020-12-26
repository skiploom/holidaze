module Main exposing (main)

import Playground exposing (..)


main =
    animation view


view time =
    [ tree
    , star |> moveUp 70 |> scale 0.75
    , overlay
    , snow time
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


snow time =
    let
        spacing =
            35

        row =
            group
                [ circle white 3 |> move (spacing * -5) 0
                , circle white 3 |> move (spacing * -4) 0
                , circle white 3 |> move (spacing * -3) 0
                , circle white 3 |> move (spacing * -2) 0
                , circle white 3 |> move (spacing * -1) 0
                , circle white 3
                , circle white 3 |> move (spacing * 1) 0
                , circle white 3 |> move (spacing * 2) 0
                , circle white 3 |> move (spacing * 3) 0
                , circle white 3 |> move (spacing * 4) 0
                , circle white 3 |> move (spacing * 5) 0
                ]
    in
    group
        [ row |> move (wave -3 3 1 time) (spacing * 5)
        , row |> move (wave -3 3 1 time) (spacing * 4)
        , row |> move (wave -3 3 1 time) (spacing * 3)
        , row |> move (wave -3 3 1 time) (spacing * 2)
        , row |> move (wave -3 3 1 time) (spacing * 1)
        , row |> move (wave -3 3 1 time) (spacing * 0)
        , row |> move (wave -3 3 1 time) (spacing * -1)
        , row |> move (wave -3 3 1 time) (spacing * -2)
        , row |> move (wave -3 3 1 time) (spacing * -3)
        , row |> move (wave -3 3 1 time) (spacing * -4)
        , row |> move (wave -3 3 1 time) (spacing * -5)
        ]


overlay =
    group
        [ rectangle lightRed 200 400 |> fade 0.1 |> moveLeft 100
        , rectangle lightBlue 200 400 |> fade 0.1 |> moveRight 100
        ]
