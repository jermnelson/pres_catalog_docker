update pg_database set datistemplate='false' where datname='template1';
drop database template1;
create database template1 encoding='UTF8' template template0;
update pg_database set datistemplate='true' where datname='template1';
