
## 启动master容器

master容器：映射到本机的端口固定，对于一些特殊的需求有帮助

```
./build.sh --profile dev --port 9091 --type master
```

## 启动普通容器

```
./build.sh
```

## 删除容器及镜像

一般是为了重新编译新的镜像

```
./rmimage.sh
```
