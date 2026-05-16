-- Product Sales Analysis III

with
    cte
    as
    (
        select product_id , min(year) as year
        from sales
        group by product_id
    )

select s1.product_id , s1.year as first_year , s1.quantity , s1.price
from sales s1
    inner join cte c
    on c.product_id = s1.product_id
        and c.year = s1.year