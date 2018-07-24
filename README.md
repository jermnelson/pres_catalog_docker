# Docker Environment for SUI-DLSS Preservation Catalog
A minimal Docker development environment for working on the DLSS
[Preservation Catalog](https://github.com/sul-dlss/preservation_catalog), useful
if having issues getting Ruby environment working locally.

## Building
To build do
`docker build -t sul-dlss/preservation_catalog .`

## Running preservation_catalog
To launch a container based on the **sul-dlss/preservation_catalog** image,
use the following Docker command, `docker run --name pres_cat --rm sul-dlss/preservation_catalog`

To map a local volume with the repository mounted, use the -v option with the
run command:

`docker run --name pres_cat --rm -v /Users/{path_to_local_preservation_catalog}:/opt/preservation_catalog`

## rspec Testing
1.  Log into the running `pres_cat` container using the docker **exec** command in
    interactive mode:

    `docker exec -it pres_cat \bin\bash`

1.  Switch user to *postrgres* to initialize the database:

    su postgres
    psql -f /opt/preservation_catalog/db/scripts/pres_setup.sql postgres
    psql -f /opt/preservation_catalog/db/scripts/pres_test_setup.sql postgres

1.  Run `bundle exec rspec` to run rspec tests

## Stopping
