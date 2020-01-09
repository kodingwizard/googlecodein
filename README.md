# Google Code In repo

This is my repository to hold the code I write to participate in Google Code In.

## Minesweeper 6.0 (in Julia)

This is my interpretation of the classic Windows game - Minesweeper. The objective of the game is to clear all the mines in the grid and survive!

The game has two modes: 
* Easy
* Hard

In the easy mode, the grid is 8x8 and there are 9 mines in random squares. Each square is marked with a number from 1 through 64 and the player has to guess where the mines are located. There is a strategy involved and the strategy is aided by providing number of mines in the adjacent squares.

The game provides a view of the numbered grid to aid square selection and the actual grid marked with "X"s. Everytime the player selects a square (select a square from 1 through the total number of squares) the game shows the number of mines in the adjacent squares. If there are no mines in the adjacent squares then a 0 is printed, if there is one mine, then 1 is printed and so on.

The hard mode just has a 16 x 16 grid with 20 mines in random squares. Enjoy playing the game!

###Game Play
```
Welcome to Minesweeper 6.0! To play this game, here are a few tips.

The first grid you will see is a list of numbers from either 1-64, or 1-256, depending on the size of the grid you choose. This is for your reference to which numbers are placed where. The second grid displays Xs, covered tiles, which will uncover the number of mines near your chosen square.

Simply choose a number from 1-64 or 1-256, and the game will tell you if you are safe... or if you have landed on a mine. If you are safe, then the grid will display the number of mines near the square you chose by replacing the chosen number with the number of mines near that square. The number 0 means there are no mines near your square. 1 means that there is 1 mine adjacent to that square, and so on. Good luck surviving...you will need it!

Choose the size of the grid: 8 (8x8) or 16 (16x16): 8
┌────┬────┬────┬────┬────┬────┬────┬────┐
│  1 │  2 │  3 │  4 │  5 │  6 │  7 │  8 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│  9 │ 10 │ 11 │ 12 │ 13 │ 14 │ 15 │ 16 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 17 │ 18 │ 19 │ 20 │ 21 │ 22 │ 23 │ 24 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 25 │ 26 │ 27 │ 28 │ 29 │ 30 │ 31 │ 32 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 33 │ 34 │ 35 │ 36 │ 37 │ 38 │ 39 │ 40 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 41 │ 42 │ 43 │ 44 │ 45 │ 46 │ 47 │ 48 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 49 │ 50 │ 51 │ 52 │ 53 │ 54 │ 55 │ 56 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 57 │ 58 │ 59 │ 60 │ 61 │ 62 │ 63 │ 64 │
└────┴────┴────┴────┴────┴────┴────┴────┘
 1   2   3   4   5   6   7   8  
┌───┬───┬───┬───┬───┬───┬───┬───┐
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
└───┴───┴───┴───┴───┴───┴───┴───┘
Enter the number of the square you want to mine:
4
┌────┬────┬────┬────┬────┬────┬────┬────┐
│  1 │  2 │  3 │  4 │  5 │  6 │  7 │  8 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│  9 │ 10 │ 11 │ 12 │ 13 │ 14 │ 15 │ 16 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 17 │ 18 │ 19 │ 20 │ 21 │ 22 │ 23 │ 24 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 25 │ 26 │ 27 │ 28 │ 29 │ 30 │ 31 │ 32 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 33 │ 34 │ 35 │ 36 │ 37 │ 38 │ 39 │ 40 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 41 │ 42 │ 43 │ 44 │ 45 │ 46 │ 47 │ 48 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 49 │ 50 │ 51 │ 52 │ 53 │ 54 │ 55 │ 56 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 57 │ 58 │ 59 │ 60 │ 61 │ 62 │ 63 │ 64 │
└────┴────┴────┴────┴────┴────┴────┴────┘
┌───┬───┬───┬───┬───┬───┬───┬───┐
│ X │ X │ X │ 0 │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
└───┴───┴───┴───┴───┴───┴───┴───┘

Here are your options. Would you like to continue playing(enter 1), or mark a square as a bomb(enter 2)?:1
Ok. Choose another square.
33
┌────┬────┬────┬────┬────┬────┬────┬────┐
│  1 │  2 │  3 │  4 │  5 │  6 │  7 │  8 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│  9 │ 10 │ 11 │ 12 │ 13 │ 14 │ 15 │ 16 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 17 │ 18 │ 19 │ 20 │ 21 │ 22 │ 23 │ 24 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 25 │ 26 │ 27 │ 28 │ 29 │ 30 │ 31 │ 32 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 33 │ 34 │ 35 │ 36 │ 37 │ 38 │ 39 │ 40 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 41 │ 42 │ 43 │ 44 │ 45 │ 46 │ 47 │ 48 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 49 │ 50 │ 51 │ 52 │ 53 │ 54 │ 55 │ 56 │
├────┼────┼────┼────┼────┼────┼────┼────┤
│ 57 │ 58 │ 59 │ 60 │ 61 │ 62 │ 63 │ 64 │
└────┴────┴────┴────┴────┴────┴────┴────┘
┌───┬───┬───┬───┬───┬───┬───┬───┐
│ X │ X │ X │ 0 │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ 1 │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ 2 │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
├───┼───┼───┼───┼───┼───┼───┼───┤
│ X │ X │ X │ X │ X │ X │ X │ X │
└───┴───┴───┴───┴───┴───┴───┴───┘
```

