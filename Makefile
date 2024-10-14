default: 
	duckdb --noheader --list -c "SELECT '{' || '\"type\":\"Feature\",' || '\"geometry\":' || ST_AsGeoJSON(geometry) || '}' AS geojson FROM 'https://data.source.coop/cholmes/overture/places-geoparquet-country/AL.parquet' LIMIT 100;"

second: 
	duckdb --noheader --list -c "SELECT to_json({ \
type: 'Feature', \
geometry: ST_AsGeoJSON(geometry), \
properties: { names : names }, \
}) AS f \
FROM 'https://data.source.coop/cholmes/overture/places-geoparquet-country/JP.parquet'\
LIMIT 10;" | jq .
