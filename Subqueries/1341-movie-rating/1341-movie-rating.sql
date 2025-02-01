-- Find the name of the user who has rated the greatest number of movies.
-- ---- lexicographically -> SORTED ALPHABETICALLY smaller user name.
-- Find the movie name with the highest average rating in February 2020. 
-- ---- smaller movie name.


(select u.name as results
from MovieRating mr
left join Users u
using(user_id)
group by u.user_id
order by count(mr.movie_id) desc, u.name
limit 1)

union

(select m.title as results
from MovieRating mr
left join Movies m
using(movie_id)
where mr.created_at like '2020-02%'
group by mr.movie_id
order by avg(mr.rating) desc, m.title 
limit 1)