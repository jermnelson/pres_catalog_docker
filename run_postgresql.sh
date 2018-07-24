#!/bin/sh
echo "Running Postgres Initialization"
su postgres
# Initialize postgre
psql -f /opt/preservation_catalog/db/scripts/pres_setup.sql postgres
psql -f /opt/preservation_catalog/db/scripts/pres_test_setup.sql postgres
psql -f fix-unicode.sql postgres
su
echo "Finished"
