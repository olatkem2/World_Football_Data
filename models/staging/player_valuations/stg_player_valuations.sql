select 
    cast(player_id as int) as player_id,
    cast(market_value as int) as market_value,
    cast(current_club_id as int) as current_club_id,
    player_club_domestic_competition_id,
    to_date(date, 'yyyy-mm-dd') as date
from {{  source('etl_airbyte_raw', 'player_valuations') }}