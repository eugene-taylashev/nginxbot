# nginxbot
A simple Docker container with a NGINX webserver that returns on port 80 as a text the following:
* LAB1 & LAB2 environmental variables
* Server IP address and port
* Server name
* Local time of the server
* the request URI
* the request ID

How to run:
```
docker run -d \
--name nginxbot \
-p 80:80/tcp \
-e LAB1='This is var1' \
-e LAB2='and var 2' \
etaylashev/nginxbot
```

To test: ``curl http://localhost:80``

Sample output:
```
Info:  This is var1 and var 2
Server address: 172.17.0.3:80
Server name: 73b4d55c25d5
Date: 20/Oct/2020:03:01:50 +0000
URI: /
Request ID: 579236e5c31f7d63c64f49badf689eed
```

See Also:
* https://github.com/nginxinc/NGINX-Demos/tree/master/nginx-hello
* https://serverfault.com/questions/577370/how-can-i-use-environment-variables-in-nginx-conf
