using PrettyTables
mines = rand(1:64, 1, 9)
println(mines)
function checkuniq(mine)
    #println(mines)
    while !(allunique(mine))
        mine = rand(1:64, 1, 9)
        return mine
    end
end

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

function user_input()
  println("Enter a number from 1:64:")
  u_input = parse(Int, readline())
  return u_input
end
if !(allunique(mines))
    mines = checkuniq(mines)
    println(mines)
    for i in mines
        println("The coordinates of mine at square ", i, " is ", coords(i))
    end
else
println("All mines are unique in first pass")
end

grid = Array{Union{String, Int32}}(undef, 8, 8)
grid .= " "
#grid = pretty_table(arr, noheader=true, hlines=1:8)
inputs = zeros(Int32, 8, 8)

inpval = user_input()
coordinates = Int32[]
coordinates = coords(inpval)
println(coordinates)
inputs[coordinates[1],coordinates[2]] = 2
#pretty_table(inputs; noheader=true, hlines=1:8)
grid[coordinates[1],coordinates[2]] = inputs[coordinates[1], coordinates[2]]
#grid[4,5] = inputs[4,5]
pretty_table(grid, noheader=true, hlines=1:8)
