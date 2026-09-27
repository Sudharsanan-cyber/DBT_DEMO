with CTE AS(
    SELECT
    
    STARTED_AT AS STARTED_AT,
    DATE(TRY_TO_TIMESTAMP(STARTED_AT)) DATE_STARTED_AT,
    HOUR(TRY_TO_TIMESTAMP(STARTED_AT)) HOUR_STARTED_AT,
    
    CASE WHEN DAYNAME(TRY_TO_TIMESTAMP(STARTED_AT)) IN ('Sat', 'Sun') THEN 'Weekend'
    else 'Business Day'
    END AS DAY_Type,
    case when month(TRY_TO_TIMESTAMP(STARTED_AT)) in (12,1,2) then 'Winter'
    when month(TRY_TO_TIMESTAMP(STARTED_AT)) in (3,4,5) then 'Spring'
    when month(TRY_TO_TIMESTAMP(STARTED_AT)) in (6,7,8) then 'Summer' else 'Autumn'
    end as STATION_OF_YEAR
    FROM    
    {{ source('demo', 'bike') }}


)

Select *
from CTE