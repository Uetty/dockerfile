# 作用说明
该容器是做为数据共享卷使用的，通过Volume指定了挂载目录，docker虚拟机会随机给容器分配卷该在在宿主机的地址，可查看Mounts值。

使用该数据地址的容器，可以使用 docker run --volumes-from name 来使用挂载点
