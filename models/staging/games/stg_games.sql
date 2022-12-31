select 
    url,
    to_date(date,'yyyy-mm-dd') as game_date,
    round,
    season,
    cast(game_id as int) as game_id,
    referee,
    stadium,
    aggregate,
    cast(attendance as int) as attendance,
    cast(away_club_id as int) as away_club_id,
    cast(home_club_id as int) as home_club_id,
    cast(away_club_goals as int) as away_club_goals,
    cast(home_club_goals as int) as home_club_goals,
    competition_type,
    away_club_manager_name,
    home_club_manager_name
from {{  source('etl_airbyte_raw', 'games') }}