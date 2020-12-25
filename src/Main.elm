module Main exposing (main)

import Playground exposing (..)


main =
    game view update ( 0, 0 )


view computer ( keyboardX, keyboardY ) =
    [ circle yellow (wave 50 200 15 computer.time) |> moveRight 200 |> fade 0.5
    , rectangle orange 20 200 |> moveX (wave 0 -240 10 computer.time) |> fade 0.9
    , rectangle red 500 50 |> moveDown 200 |> rotate (zigzag -20 20 4 computer.time) |> fade 0.7
    , square green 250 |> move -40 100 |> fade 0.4 |> rotate (spin 2 computer.time)
    , pentagon purple 100 |> move 60 200 |> rotate 15 |> fade 0.3
    , words (changeColor computer.mouse.down) "hallo" |> scale 10 |> moveX computer.mouse.x |> moveY computer.mouse.y
    , image 96 96 "https://elm-lang.org/images/turtle.gif" |> move -200 -200 |> rotate 40 |> move keyboardX keyboardY
    ]


update computer ( keyboardX, keyboardY ) =
    ( keyboardX + toX computer.keyboard
    , keyboardY + toY computer.keyboard
    )


changeColor isMouseDown =
    if isMouseDown then
        orange

    else
        blue
