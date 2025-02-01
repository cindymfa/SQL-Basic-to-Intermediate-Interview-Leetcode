-- Find the name of the user who has rated the greatest number of movies.
-- ---- lexicographically -> SORTED ALPHABETICALLY smaller user name.
-- Find the movie name with the highest average rating in February 2020. 
-- ---- smaller movie name.
(select Users.name as results
from MovieRating 
left join Users
using(user_id)
group by Users.user_id
order by count(MovieRating.movie_id) desc, Users.name
limit 1)

union all

(select m.title
from Movies m
right join MovieRating mr
using(movie_id)
where mr.created_at like '2020-02%'
group by mr.movie_id
order by avg(mr.rating) desc, m.title
limit 1)
