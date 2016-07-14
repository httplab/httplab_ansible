PG_CONFIG=/var/lib/postgresql/data/postgresql.conf

sed -ri 's/^(#|)synchronous_commit .*$/synchronous_commit = off/g' $PG_CONFIG
sed -ri 's/^(#|)checkpoint_completion_target .*$/checkpoint_completion_target = 0.9/g' $PG_CONFIG
sed -ri 's/^(#|)shared_buffers .*$/shared_buffers = 512MB/g' $PG_CONFIG
