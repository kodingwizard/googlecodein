mines = Int32[]
mines = rand(1:64, 1, 9)
println(mines)
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
mines_coord = Int32[]
for i in 1:length(mines)
   # println(coords(mines[i]))
    mines_coord = coords(mines[i])
    println(mines_coord)
end
