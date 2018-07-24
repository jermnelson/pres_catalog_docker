FROM ruby:2.4.4

ENV HOME /opt/preservation_catalog
ENV REPO https://github.com/sul-dlss/preservation_catalog.git


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get update && \
    apt-get install -y supervisor && \
    apt-get install -y postgresql postgresql-contrib && \
    cd /opt && wget http://download.redis.io/releases/redis-4.0.10.tar.gz && \
    tar xzf redis-4.0.10.tar.gz && \
    cd redis-4.0.10 && make && \
    chmod +x /usr/local/bin/run_postgresql.sh

RUN git clone --depth 5 $REPO $HOME && \
    cd $HOME && \
    bundle install # This doesn't work if volume is mapped to Host's git repo

COPY run_postgresql.sh $HOME/run_postgresql.sh
COPY fix-unicode.sql $HOME/fix-unicode.sql

RUN mkdir -p /var/pgsql/data && \
    chown -R postgres /var/pgsql

USER postgres

RUN ./usr/lib/postgresql/9.6/bin/initdb -D /var/pgsql/data --encoding=SQL_ASCII

USER root

CMD ["/usr/bin/supervisord", "-n"]
