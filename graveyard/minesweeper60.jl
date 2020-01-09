println("Welcome to Minesweeper 6.0! To play this game, here are a few tips.\n\nThe grid you will see is a list of numbers from either 1-64, or 1-256, depending on the size of the grid you choose. Once you have chosen the size, you will have to work your way around the mines to come out alive  ;).\n\nSimply choose a number from 1-64 or 1-256, and the game will tell you if you are safe...or if you have landed on a mine. If you are safe, then you will also know how many mines are near you in the adjacent squares. Good luck surviving...you will need it!\n")
using Random #importing the random library
using PrettyTables #importing the drawings library, for making grids and tables
println("Choose the size of the grid: 8 (8x8) or 16 (16x16)\n")
n = parse(Int, readline())
total_squares = n*n
grid = reshape(1:total_squares,(n,n))'
pretty_table(grid;noheader = true, hlines = 1:n)
#show(grid)
#println(grid)
if n == 8
  num_mines = 9 #number of mines inserted
elseif n == 16
  num_mines = 20
end

mines = rand(1:total_squares, 1, num_mines)
#This is so that you can see the randomly selected numbers that are "mines". 
for i in 1:num_mines # this will list the number corresponding to the mine
  mined_sq(i) = mines[i]
end
function find_mines()
  distance = [1, 7, 8, 9]
  pos_squares = Int[]
  neg_squares = Int[]
  for i in 1:length(distance)
    push!(pos_squares, u_input + distance[i])
    #println()
  end
  for i in 1:length(distance)
    push!(neg_squares, u_input - distance[i])
    #println(neg_squares)
  end
  adj_squares = vcat(pos_squares, neg_squares)
  #println(adj_squares)
  united = findall(in(mines), adj_squares)
  println("There are ", length(united), " mines in the adjacent squares")
end
opened_squares = Int[]
println("Choose a number between 1 and ", total_squares, " :")#ask user to choose a square
global u_input = parse(Int, readline())#forces Julia to interpret user input as an integer so it can compare the input with the mines
find_mines()
if u_input < total_squares
  push!(opened_squares, u_input)
end
#while u_input > n
# println("Invalid square. Choose another one:")
while u_input > total_squares && !(u_input in mines)
  print("Invalid square, choose another one:")
  find_mines()
  global u_input = parse(Int, readline())
  if u_input < total_squares
    push!(opened_squares, u_input)
  end
end
  safe = while  u_input < total_squares && !(u_input in mines)
    println("Safe. Choose another square:")
    find_mines()
    global u_input = parse(Int, readline())

function play()
println("Here are your options. Would you like to continue playing(enter 1), or mark a square as a bomb(enter 2)?:")
mark_squares = parse(Int, readline())
    if mark_squares == 1
      println("Ok. Choose another square.")
      choice = parse(Int, readline())
        if !(choice in mines)
          println(safe)
        else choice in mines
          println(end_game)
	end
    elseif mark_squares == 2 
      println(mines)
      println("Choose a square to pop:")
      pop_bomb = parse(Int, readline())
      if pop_bomb in mines
        idx = findfirst(isequal(pop_bomb), mines)
        global mines = deleteat!(mines, idx)
        println(mines)
        else
        play()
        end
    end
end
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

  
      

  #if the number given by the user is not one of the random numbers chosen by the computer, then the user is "safe" and the computer asks for another input... 
    if !(u_input in opened_squares)
      push!(opened_squares, u_input)
      println("Already opened squares: ")
      for i in 1:length(opened_squares)
      println(opened_squares[i])
      replace(grid, opened_squares => 0)
      end
    end
  end

#end
end_game = println("Boom!You died!\nThese are where the mines were hidden; squares \n", mines))
#Note: global means that the variable has not been defined in the loop, but outside of the loop. 
#TODO: Implement error handling for invalid inputs
#TODO: Implement GUI using text characters and simulate actual minesweeper
#OPTIONAL TODO: If there are no mines in nearby 3 squares, inform the user accordingly.
