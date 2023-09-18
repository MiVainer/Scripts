#!/bin/bash

cat > /var/lib/postgresql/.walg.json << EOF
{
    "WALG_S3_PREFIX": "s3://mipostgresql",
    "AWS_ACCESS_KEY_ID": "4myTLQodNmHPQF8wEVjJBR",
    "AWS_SECRET_ACCESS_KEY": "37P2wcniAEZujMChh5MXD5iWoGabYW7dqjKB3MCKo4ap",
    "WALG_COMPRESSION_METHOD": "brotli",
    "WALG_DELTA_MAX_STEPS": "5",
    "PGDATA": "/var/lib/postgresql/data",
    "PGHOST": "/var/run/postgresql/.s.PGSQL.5432"
}
EOF
# обязательно меняем владельца файла:
chown postgres: /var/lib/postgresql/.walg.json
