@echo off
echo Pulling the latest image...
docker pull ashishkumar9/shopkart:latest

echo Stopping and removing the old container (if exists)...
docker stop shopkart
docker rm shopkart

echo Running the new container...
docker run -d --name shopkart -p 1010:1010 ashishkumar9/shopkart:latest

echo Application is now running at http://localhost:1010
pause
