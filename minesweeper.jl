println("Welcome to Minesweeper 6.0! To play this game, here are a few tips.\n\nThe grid you will see is a list of numbers from either 1-64, or 1-256, depending on the size of the grid you choose. Once you have chosen the size, you will have to work your way around the mines to come out alive  ;).\n\nSimply choose a number from 1-64 or 1-256, and the game will tell you if you are safe... or if you have landed on a mine. If you are safe, then you will also know how many mines are near you in the adjacent squares. Good luck surviving...you will need it!\n")
using Random #importing the random library
using PrettyTables #importing the drawings library, for making grids and tables
function generate_grid()
  println("Choose the size of the grid: 8 (8x8) or 16 (16x16)\n")
  global n = parse(Int, readline())
  global total_squares = n*n
  global grid = reshape(1:total_squares,(n,n))'
  #global blank_grid = rand(" ", 8,8)
  global pretty_grid = pretty_table(grid;noheader = true, hlines = 1:n)
  if n == 8
    global num_mines = 9 #number of mines inserted
  elseif n == 16
    global num_mines = 20
  end
  global mines = rand(1:total_squares, 1, num_mines)
end
#This is so that you can see the randomly selected numbers that are "mines". 
#for i in 1:num_mines # this will list the number corresponding to the mine
#  mined_sq(i) = mines[i]
#end
function user_input()
  global u_input = parse(Int, readline())
  return u_input
end
function first_pass()
  #global opened_squares = Int[]
  #global united = Int[]
  #ask user to choose a square
  println(mines)
  println("Choose a number between 1 and ", total_squares, " :")
  #forces Julia to interpret user input as an integer so it can compare the input with the mines
  user_input()
  invalid_input()
  discovered_squares()
  find_mines()
  check_mines(user_input())
  #flag_squares()
  #discovered_squares()
end
function flag_squares()
  if !(u_input in opened_squares)
    discovered_squares()
    println("Already opened squares: ")
    for i in 1:length(opened_squares)
      #println(opened_squares[i])
      println("Mined squares in flag_squares: ", united)
      #println(length(united))
      global grid = replace(grid, opened_squares[i] => length(united))
      #replace(grid, u_input => length(united))
    end
  global pretty_grid = pretty_table(grid;noheader = true, hlines = 1:n)
  find_mines()
  play()
  end
end
function find_mines()
  global distance = [1, 7, 8, 9]
  global pos_squares = Int[]
  global neg_squares = Int[]
  for i in 1:length(distance)
    push!(pos_squares, u_input + distance[i])
  end
  for i in 1:length(distance)
    push!(neg_squares, u_input - distance[i])
  end
  global adj_squares = vcat(pos_squares, neg_squares)
  #println(adj_squares)
  global united = findall(in(mines), adj_squares);
  #println("Mined squares:", united)
  #println(united)
  #println("There are ", length(united), " mines in the adjacent squares")
  return united
  #global adj_mines = replace(pretty_grid, u_input => length(united))
  #println(adj_mines)
 # play()
end
function end_game()
  if u_input in mines
    println("Boom! You died! This is where the mines were hidden: ", mines)
  exit()
  end
end
#find_mines()
function check_mines(u_input)
  if !(u_input in mines)
    invalid_input()
    flag_squares()
  elseif u_input in mines
    end_game()
  end
end
function play()
println("Here are your options. Would you like to continue playing(enter 1), or mark a square as a bomb(enter 2)?:")
  global mark_squares = parse(Int, readline())
    if mark_squares == 1
      println("Ok. Choose another square.")
      user_input()
      check_mines(u_input)
    elseif mark_squares == 2 
      #println(mines)
      println("Choose a square to pop:")
      global pop_bomb = parse(Int, readline())
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
  global opened_squares = Int[]
  if u_input < total_squares
    push!(opened_squares, u_input)
  end
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
