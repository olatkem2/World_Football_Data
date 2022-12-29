select 
    cast(goals as int) as goals,
    cast(assists as int) as assists,
    cast(game_id as int) as game_id,
    cast(player_id as int) as player_id,
    cast(red_cards as int) as red_cards,
    cast(yellow_cards as int) as yellow_cards,
    appearance_id,
    competition_id,
    cast(minutes_played as int) as minutes_played,
    cast(player_club_id as int) as player_club_id,
    player_pretty_name
--  cast(date as date) as appearances_date 

from {{  source('etl_airbyte_', 'appearances') }}