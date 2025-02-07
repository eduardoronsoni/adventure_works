/* generating dates using the macro from the dbt-utils package */
with 
    dates_raw as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('1970-01-01' as date)",
        end_date="DATEADD(year, 100, current_date())"
        )
    }}
)

/* extracting some date information and renaming some columns to English */
    , days_info as (
        select 
            cast(date_day as date) as day_date
            , extract(dayofweek from date_day) as weekday
            , extract(month from date_day) as month
            , extract(quarter from date_day) as quarter
            , extract(dayofyear from date_day) as day_of_year
            , extract(year from date_day) as year
            , TO_CHAR(date_day, 'DD-MM') as day_month
        from dates_raw
    )

/* renaming the column meanings, translating them into English */
    , days_named as (
        select
            *
            , case
                when weekday = 1 then 'Sunday'
                when weekday = 2 then 'Monday'
                when weekday = 3 then 'Tuesday'
                when weekday = 4 then 'Wednesday'
                when weekday = 5 then 'Thursday'
                when weekday = 6 then 'Friday'
                else 'Saturday' 
            end as day_name
            , case
                when month = 1 then 'January'
                when month = 2 then 'February'
                when month = 3 then 'March'
                when month = 4 then 'April'
                when month = 5 then 'May'
                when month = 6 then 'June'
                when month = 7 then 'July'
                when month = 8 then 'August'
                when month = 9 then 'September'
                when month = 10 then 'October'
                when month = 11 then 'November'
                else 'December' 
            end as month_name
            , case
                when month = 1 then 'Jan'
                when month = 2 then 'Feb'
                when month = 3 then 'Mar'
                when month = 4 then 'Apr'
                when month = 5 then 'May'
                when month = 6 then 'Jun'
                when month = 7 then 'Jul'
                when month = 8 then 'Aug'
                when month = 9 then 'Sep'
                when month = 10 then 'Oct'
                when month = 11 then 'Nov'
                else 'Dec' 
            end as month_abbr
            , case
                when quarter = 1 then '1st Quarter'
                when quarter = 2 then '2nd Quarter'
                when quarter = 3 then '3rd Quarter'
                else '4th Quarter' 
            end as quarter_name
            , case
                when quarter in(1,2) then 1
                else 2
            end as semester
            , case
                when quarter in(1,2) then '1st Semester'
                else '2nd Semester'
            end as semester_name
        from days_info
    )

/* rearranging the columns */
    , final_cte as (
        select 
            day_date
            , weekday
            , day_name
            , month
            , month_name
            , month_abbr
            , quarter
            , quarter_name
            , semester
            , semester_name
            , day_of_year
            , year
        from days_named
    )

select * 
from final_cte
