# how to?

## step 1: spin it up
`docker-compose up -d`

## step 2: access the container
`docker exec -it my_postgres_db bash`

## step 3: connect to posgresql
`psql -U mypguser -d mypgdatabase`

## step 4: view the data
- list all tables `\dt`
- view the **topics** table `SELECT * FROM topics;`