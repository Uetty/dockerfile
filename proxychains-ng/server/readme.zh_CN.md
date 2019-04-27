# 这是配置服务器端提供服务都方法
## 初次启动
1. 宿主机上运行启动容器命令：
   docker run --net=host --name=socks -t uetty/shadowsocks:server
   ctrl + c 退出
2. 进入容器内部：
   docker exec -it socks bash
   修改 /etc/shadowsocks.json 文件(vim /etc/shadowsocks.json)：
   按i键编辑文件
   设置端口、密码（可设置多对）、以及加密方式(method)
   保存(依次：ctrl + c  ->  输入:wq  ->  回车)
3. 在容器内部运行命令：
   ssserver -c /etc/shadowsocks.json -d start
   退出容器，先后按下：
   ctrl + p     ctrl + q

在本地电脑使用客户端连接该服务器尝试是否代理成功


## 关闭代理方式（第二步根据需要选择）
1. 进入容器：
   docker exec -it socks bash
   执行停止命令：
   ssserver -c /etc/shadowsocks.json -d stop


## 重启服务器后重新启动代理（服务器较少出现重启）

1. docker start socks

2. docker exec -it socks bash

3. 此时已进入容器中，执行：
   ssserver -c /etc/shadowsocks.json -d start


