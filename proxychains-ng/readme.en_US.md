build base ubuntu 18.04
# usage

1. Startup container in host: docker run --net= host-t uetty/shadowsocks

2. Modify the server address, port, password, method of the /etc/shadowsock.json file in containner

3. Run cmd in container: sslocal-c /etc/ shadowsock.json-d start

4. Operation on the host machine:
   setting -> network -> network agent -> manually -> socks host line, set host: 127.0.0.1, port: 1080, ignore host: localhost, 127.0.0.0/8, :1
   close the setting dialog

