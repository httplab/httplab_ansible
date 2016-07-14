FROM postgres

ADD patch_pg_config.sh /docker-entrypoint-initdb.d/
RUN chmod 755 /docker-entrypoint-initdb.d/patch_pg_config.sh
