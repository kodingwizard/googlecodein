mines = rand(1:64, 1, 9)
println(mines)
function checkuniq(ads)
    #println(mines)
    while !(allunique(ads))
    	ads = rand(1:64, 1, 9)
	return ads
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

if !(allunique(mines))
    mines = checkuniq(mines)
    println(mines)
    for i in mines
    	println("The coordinates of mine at square ", i, " is ", coords(i))
    end
else
println("All mines are unique in first pass")
end
