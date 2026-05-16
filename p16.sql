-- Average Selling Price

select p.product_id, round(COALESCE(sum(p.price * u.units) / sum(u.units), 0), 2) as average_price
from prices p
    left join UnitsSold u on p.product_id = u.product_id
        and purchase_date  between start_date and end_date
group by  p.product_id