-- Game Play Analysis IV

with
    PlayerFirstLogin
    as
    (
        select player_id, min(event_date) as firstDay,
            DATE_ADD(MIN(event_date), INTERVAL
     1 DAY) AS next_day
from Activity a
group by player_id
)

select
    round(count(*) / (select count(*)
    from PlayerFirstLogin), 2) as fraction
from
    PlayerFirstLogin a inner join Activity b
    on 
b.player_id = a.player_id and b.event_date = a.next_day 