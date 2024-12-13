@echo off
echo Pulling the latest image...
docker pull ashishkumar9/shopkart:latest

echo Stopping and removing the old container (if exists)...
docker stop shopkart
docker rm shopkart

echo Running the new container...
docker run -d --name shopkart -p 1010:1010 ashishkumar9/shopkart:latest

echo Reloading NGINX...
:: Navigate to the NGINX directory (adjust the path as per your NGINX installation)
cd C:\nginx

echo Reloading NGINX...
:: Navigate to the NGINX directory (adjusted to the specified path)
cd /d C:\Users\in1169.NOIDA\Downloads\nginx-1.26.2 || (
    echo "Failed to navigate to NGINX directory. Please verify the path."
    pause
    exit /b 1
)

:: Reload NGINX configuration
nginx -s reload || (
    echo "NGINX reload failed, attempting restart"
    nginx -s stop
    nginx
)

echo Application is now running at http://localhost:1010
pause
