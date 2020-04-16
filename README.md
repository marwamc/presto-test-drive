# presto-test-drive
We test drive presto using [this docker version](https://hub.docker.com/r/starburstdata/presto)


## Dry-run

```
  make start
  make inspect
  make stop 
```

This deploys a Presto server listens on port `8080` and runs a few queries

# TO-DO

- [ ] Add postgres connector - query postgres from presto
- [ ] Option to run a single presto node, or cluster with 1 coordinator, and n workers
- [ ] Create imagaes and push to personal docker
- [ ] circleci
- [ ] we has clean cluster and can run some real analysis...


# References

https://prestodb.io/docs/current/index.html

https://github.com/IBM/docker-prestodb

https://github.com/IBM/presto-db2

Inspirational fork: https://github.com/shawnzhu/docker-prestodb

Docker hive: https://github.com/big-data-europe/docker-hive

Postgres as hive metastore: https://github.com/big-data-europe/docker-hive-metastore-postgresql
