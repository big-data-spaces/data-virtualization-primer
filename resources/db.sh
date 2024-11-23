
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE nyc_weather (
      station VARCHAR(11),
      name VARCHAR(100),
      date TIMESTAMP,
      awnd NUMERIC,
      prcp NUMERIC,
      snow NUMERIC,
      snwd NUMERIC,
      tempmax NUMERIC,
      tempmin NUMERIC
    );

    COPY nyc_weather FROM '/resources/NYC-weather.csv' WITH (FORMAT csv, HEADER);
EOSQL

