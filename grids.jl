using Luxor
tiles = Tiler(800, 500, 4, 5, margin=5)
   for (pos, n) in tiles
       randomhue()
           box(pos, tiles.tilewidth, tiles.tileheight, :fill)
	       if n % 3 == 0
	               gsave()
		               translate(pos)
			               subtiles = Tiler(tiles.tilewidth, tiles.tileheight, 4, 4, margin=5)
				               for (pos1, n1) in subtiles
					                   randomhue()
							               box(pos1, subtiles.tilewidth, subtiles.tileheight, :fill)
								               end
									               grestore()
										           end
											       sethue("white")
											           textcentered(string(n), pos + Point(0, 5))
												   end
