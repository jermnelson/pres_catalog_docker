#!/bin/sh
echo "Running Postgres Initialization"

# Initialize postgre
su postgres -c "psql -f /opt/preservation_catalog/db/scripts/pres_setup.sql postgres"
su postgres -c "psql -f /opt/preservation_catalog/db/scripts/pres_test_setup.sql postgres"
su postgres -c "psql -f /tmp/fix-unicode.sql postgres"

echo "Finished"
