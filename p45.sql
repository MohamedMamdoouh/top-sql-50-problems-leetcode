-- Patients With a Condition

select *
from patients
where conditions like 'DIAB1%' or conditions like '% DIAB1%'