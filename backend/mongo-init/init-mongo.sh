#!/bin/bash
# init-mongo.sh

# Wait for MongoDB to fully start up (optional, but a good practice)
echo "Waiting for MongoDB to start..."
sleep 10 

# Execute mongoimport using the appropriate tool (mongosh or mongo)
# The --authenticationDatabase=admin and -u, -p are needed if authentication is enabled

docker exec mongo mongoimport --db wanderlust --collection posts --file /docker-entrypoint-initdb.d/sample_posts.json --jsonArray 

echo "Data imported successfully!"