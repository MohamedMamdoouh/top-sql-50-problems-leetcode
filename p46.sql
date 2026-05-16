-- Delete Duplicate Emails

delete x1 from person x1
    inner join person x2
    on x1.email = x2.email AND x1.id > x2.id