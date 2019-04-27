build base ubuntu 18.04
# this is server side helper
## usage

1. Startup container in host: docker run --net= host-t uetty/shadowsocks:server

2. Modify the port_password, method of the /etc/shadowsock.json file in containner

3. Run cmd in container: ssserver -c /etc/ shadowsock.json-d start


