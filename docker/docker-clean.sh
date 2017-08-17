echo "1. Make sure that exited containers are deleted."
docker rm -v $(docker ps -a -q -f status=exited)

echo "2. Remove unwanted ‘dangling’ images."
docker rmi $(docker images -f "dangling=true" -q)

echo "3. Still not enough space? What is this ‘vfs’ directory?"
docker volume rm $(docker volume ls -qf dangling=true)
