docker build -t roblabweb .
docker run -it --restart unless-stopped -d -p 80:80 --name roblabweb roblabweb nginx -g 'daemon off;'