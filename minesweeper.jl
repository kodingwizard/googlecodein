println("Welcome to Minesweeper 6.0! To play this game, here are a few tips.\n\nThe first grid you will see is a list of numbers from either 1-64, or 1-256, depending on the size of the grid you choose. This is for your reference to which numbers are placed where. The second grid displays Xs, covered tiles, which will uncover the number of mines near your chosen square.\n\nSimply choose a number from 1-64 or 1-256, and the game will tell you if you are safe... or if you have landed on a mine. If you are safe, then the grid will display the number of mines near the square you chose by replacing the chosen number with the number of mines near that square. The number 0 means there are no mines near your square. 1 means that there is 1 mine adjacent to that square, and so on. Good luck surviving...you will need it!\n")
using Random #importing the random library
using PrettyTables #importing the drawings library, for making grids and tables
function generate_grid()
  print("Choose the size of the grid: 8 (8x8) or 16 (16x16): ")
  global n = parse(Int32, readline())
  global total_squares = n*n
  #global grid = reshape(1:total_squares,(n,n))'
  #pretty_table(grid;noheader = true, hlines = 1:n)
  #area_hgt_wid = 8
  global grid = reshape(1:total_squares, (n, n))'
  pretty_table(grid, noheader=true, hlines = 1:n)
  global arr = Array{Union{String, Int32}}(undef, n, n)
  arr .= "X"
  for i in 1:n
    print(" ", i, "  ")
  end
  print("\n")
  pretty_table(arr, noheader=true, hlines = 1:n)
  global inputs = zeros(Int32, n, n)
  if n == 8
    num_mines = 9 #number of mines inserted
  elseif n == 16
    num_mines = 20
  end
  global mines = rand(1:total_squares, 1, num_mines)
  if !(allunique(mines))
    mines = checkuniq(mines)
  end
  global mines_coord = Int32[]
  for i in 1:length(mines)
    mines_coord = coords(mines[i])
    #println(mines_coord)
  end
end
#This is so that you can see the randomly selected numbers that are "mines". 
#for i in 1:num_mines # this will list the number corresponding to the mine
#  mined_sq(i) = mines[i]
#end
function coords(c)
    if c % 8 == 0
      y = 8
      x = c ÷ 8
    else
      y = c % 8
      x = (c ÷ 8) + 1
    end
  return x, y
end

function checkuniq(mine)
#println(mines)
  while !(allunique(mine))
    mine = rand(1:64, 1, 9)
    return mine
  end
end

function user_input()
  global u_input = parse(Int32, readline())
  return u_input
end
function first_pass()
  global opened_squares = Int32[]
  global unitedarr = Int32[]
  #ask user to choose a square
  println("Enter the number of the square you want to mine:")
  #forces Julia to interpret user input as an integer so it can compare the input with the mines
  user_input()
  check_mines(u_input)
  #find_mines()
  invalid_input()
  #flag_squares()
  discovered_squares()
end
function flag_squares()
  if !(u_input in opened_squares)
    discovered_squares()
    for i in 1:length(opened_squares)
      coords_openedsquares = coords(opened_squares[i])
      inputs[coords_openedsquares[1], coords_openedsquares[2]] = unitedarr[i]
      arr[coords_openedsquares[1], coords_openedsquares[2]] = inputs[coords_openedsquares[1], coords_openedsquares[2]]
    end
  pretty_table(grid, noheader = true, hlines = 1:n)
  pretty_table(arr, noheader=true, hlines = 1:n)
  end
end
function find_mines()
  distance = [1, 7, 8, 9]
  pos_squares = Int32[]
  neg_squares = Int32[]
  for i in 1:length(distance)
    push!(pos_squares, u_input + distance[i])
  end
  for i in 1:length(distance)
    push!(neg_squares, u_input - distance[i])
  end
  adj_squares = vcat(pos_squares, neg_squares)
  global united = findall(in(mines), adj_squares)
  push!(unitedarr, length(united))
  flag_squares()
  play()
end
function end_game()
  println("Boom! You died! This is where the mines were hidden: ", mines)
#  if u_input in mines
#    pretty_table(arr, noheader = true, hlines = 1:n)
#    game_over = replace(arr, mines => "RIP")
#    print(game_over)
#:w  end
  exit()
end
#find_mines()
function check_mines(u_input)
  if !(u_input in mines)
    invalid_input()
    find_mines()
    #flag_squares()
  elseif u_input in mines
    end_game()
  end
end
function play()
print("Here are your options. Would you like to continue playing(enter 1), or mark a square as a bomb(enter 2)?:")
  mark_squares = parse(Int32, readline())
    if mark_squares == 1
      println("Ok. Choose another square.")
      user_input()
      check_mines(u_input)
    elseif mark_squares == 2 
      #println(mines)
      println("Choose a square to pop:")
      pop_bomb = parse(Int32, readline())
      if pop_bomb in mines
        idx = findfirst(isequal(pop_bomb), mines)
        println(idx)
        global mines = deleteat!(mines, idx)
        #println(mines)
      else
        play()
      end
    end
end
function discovered_squares()
  if u_input < total_squares
    push!(opened_squares, u_input)
  end
  #println("The opened squares so far are: ", opened_squares)
  return opened_squares
end
#while u_input > n
# println("Invalid square. Choose another one:")
function invalid_input()
  while u_input > total_squares && !(u_input in mines)
    print("Invalid square, choose another one:")
  end
end
#safe = while u_input < total_squares && !(u_input in mines)
function main()
  generate_grid()
  first_pass()
  play()
end
main()
#if the number given by the user is not one of the random numbers chosen by the computer, then the user is "safe" and the computer asks for another input... 
#println("Would you like to mark a square as a bomb?(yes or no)?:")
#mark_squares = readline()
 # if mark_squares == "yes"
  #  mine = "__"
   # mark_squares = replace(grid, u_input => mine)
  #elseif mark_squares == "no"
   # println("Ok then. Let's continue.", safe)
  #else
   # println("I don't understand.", mark_squares)
  #end
#end
#Note: global means that the variable has not been defined in the loop, but outside of the loop. 