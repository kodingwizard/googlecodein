grid = reshape(1:16, (4,4))'
for i in 1:16
    grid = replace(grid, grid[i] => 0)
end
println(grid)
