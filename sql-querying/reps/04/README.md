# 04 · Average each book

Return every book's title, its average rating rounded, and how many ratings it has. Books with no ratings stay in the result. Order by average, highest first, with unrated books at the bottom, then by title.

Expected: 9 rows. *The Seven Moons of Maali Almeida* averages 4.25 over 2 ratings, *The Books of Jacob* 3.95 over 2, and *The Employees* has a `NULL` average and a count of 0. If an unrated book shows a count of 1, you counted joined rows instead of ratings.
