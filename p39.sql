-- Movie Rating

with
    user_ratings
    as
    (
        select u.name, count(*) as rated_count
        from MovieRating mr join Users u on mr.user_id = u.user_id
        group by u.user_id, u.name
        order by rated_count desc, u.name asc
    limit 1
),

movie_ratings
    
     as
(
    select m.title, avg(mr.rating) as avg_rated
from MovieRating mr join Movies m on mr.movie_id = m.movie_id
where mr.created_at between '2020-02-01' AND '2020-02-29'
group by m.movie_id, m.title
order by avg_rated desc, m.title asc
    limit 1
)

select name
as results from user_ratings 
union all
select title
from movie_ratings;
