with clubs as (

    select * from {{ ref('stg_clubs' )}}

),
    competitions as (

    select * from {{ ref('stg_competitions') }}

)

select co.country_name, co.pretty_name, cl.name, count(*) as no_competition
 from competitions as co
 left join clubs as cl
using(competition_id)--clubs.domestic_competition_id=competitions.competition_id
group by co.country_name, co.pretty_name, cl.name
order by 1