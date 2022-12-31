select
    url,
    foot,
    name,
    cast(club_id as int) as club_id,
    position,
    club_name,
    cast(player_id as int) as player_id,
    agent_name,
    last_season as last_season_year,
    height_in_cm,
    city_of_birth,
    country_of_birth,
    country_of_citizenship,
    to_date(date_of_birth, 'yyyy-mm-dd') as date_of_birth,
    market_value_in_gbp
from {{  source('etl_airbyte_raw', 'players') }}