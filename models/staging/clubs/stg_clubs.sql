select 
    url,
    name,
    cast(club_id as int) as club_id,
    coach_name,
    cast(squad_size as int) as squad_size,
    cast(average_age as dec) as average_age,
    stadium_name,
    cast(stadium_seats as int) as stadium_seats,
    cast(foreigners_number as int) as foreigners_number,
    cast(total_market_value as dec) as total_market_value,
    cast(foreigners_percentage as dec) as foreigners_percentage,
    cast(national_team_players as int) as national_team_players,
    domestic_competition_id
from {{  source('etl_airbyte_raw', 'clubs') }}