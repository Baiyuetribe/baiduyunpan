## 百度云盘Docker版

适用范围：百度云盘linux版，支持centos、debian、ubuntu、树莓派，也只是Windows、mac等系统

### 特点：

- 非会员用户也可以获得不错的下载速度
- 镜像轻量，安装迅速
- 可迁移至任意Docker环境下的机器，比如linux服务器或本地电脑等

### 运行：

```
docker run -itd -p 5299:5299 --name baidu -v /opt/BDdownload:/root/Downloads baiyuetribe/baiduyunpan
```

说明：

- 若要改端口号，比如要改成`2020`，可修改`5299:5299`为`2020:5299`
- 宿主机挂载目录为`/opt/BDdownload`
- 运行日志查看命令：`docker logs baidu`
- 删除容器：`docker rm -f baidu`

若无可视化文件管理器面板，可搭配`H5ai`或`filebroser`或`kodexplore`任意一个即可。

H5ai:

```
docker run -d -p 10010:80 -v /opt/BDdownload:/h5ai --name h5ai ilemonrain/h5ai:full
```

Kodexplore:

```
docker run -d -p 999:80 --name kodexplorer -v /opt/BDdownload:/code baiyuetribe/kodexplorer
```

### 其它设备

linux系统按上述操作即可，windows系统下，需要修改挂载路径，比如要下载文件到电脑`C`盘`Download`目录下，可运行命令改为：

```
docker run -itd -p 5299:5299 --name baidu -v c:\\Download:/root/Downloads baiyuetribe/baiduyunpan
```

技巧：将window路径中的`\`都改为`\\`即可。

更多资源请参考：[佰阅部落](https://baiyue.one)

