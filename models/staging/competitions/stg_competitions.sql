select 
    url,
    name,
    type,
    sub_type,
    cast(country_id as int) as country_id,
    pretty_name,
    country_name,
    confederation,
    competition_id,
    country_latitude,
    country_longitude,
    domestic_league_code
from {{  source('etl_airbyte_raw', 'competitions') }}


