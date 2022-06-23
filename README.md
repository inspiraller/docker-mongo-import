# Setup
- git clone https://github.com/inspiraller/docker-mongo-import.git
- cd docker-mongo-import
- copy .env.example to .env 

**start**
- npm run mongo

**expected**
- Will load up docker of mongo as host: mongo1
- Will load up docker image of mongo-express connecting to mongo1
- Will load up node - wait.sh to wait until mongo1 is ready then run node-import-csv app to import latest.csv into mongo

# Close everything down
```
cd mongodb && docker-compose down
docker ps -a
docker stop mongo1
docker stop node-import
docker stop mongo-express 

// optional: docker-container prune
docker rm mongo1
docker rm node-import
docker rm mongo-express

// optional: docker-volume prune
docker volume ls
docker volume rm mongodb_volume-mongo

docker image ls
docker image rm mongo:4
docker image rm mongodb_node-import
```

# Usefule
# Credits:
- https://www.bmc.com/blogs/mongodb-docker-container/#:~:text=Go%20to%20the%20%E2%80%9Cmongodb%E2%80%9D%20folder,container%20as%20a%20background%20process.&text=The%20up%20command%20will%20pull,yml%20file.
- https://docs.linuxserver.io/general/understanding-puid-and-pgid
Using the PUID and PGID allows our containers to map the container's internal user to a user on the host machine. All of our containers use this method of user mapping and should be applied accordingly.
- https://marioyepes.com/mongodb-express-using-docker/
- admin docker mongo auth - https://medium.com/@MaxouMask/secured-mongodb-container-6b602ef67885
- bulk import via node - https://code.tutsplus.com/articles/bulk-import-a-csv-file-into-mongodb-using-mongoose-with-nodejs--cms-29574
- authenticationDatabase demo - https://dev.to/efe136/how-to-enable-mongodb-authentication-with-docker-compose-2nbp
- seeding db - https://valenciandigital.com/insights/seeding-data-into-mongodb-using-docker
-  Mongo data types - https://data-flair.training/blogs/mongodb-data-types/
# Login interactively
docker exec -it mongo1 bash

# Login to admin with user/pass
# User must log into admin database, in order to then switch to database - because we set - "userAdminAnyDatabase" which only applies to admin
- mongo -u boot -p secret admin
- use mongo_todos_db

# view imported todos
db.todos.find().toArray()
