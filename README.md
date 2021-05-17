# 2021/03/18
- 规定所有镜像的entrypoint 都为shell
# 2020/09/02 v1.10
- 增加--local 选项，等同于配置档中nodeSelct: physical
- 报错的pod 将自动删除，并在当前目录输出报错日志：{pod-name}.log

# snakekube
Turn snakemake jobs to kubernetes pods
## 使用方法:
需要事先建好pvc
```sh
./snakekube -c $command -p $cpu -r $ram -s $pvc -m $image -f $config_file
```
## config_file 格式:
``` yaml
# 建议在yaml写的内容
image: docker-images
labels: MG00001
# 建议在命令行写的内容
cmd: "sleep 10s"
cpu: 1
memory: "10Mi"
# Optional configure
mountPath: '挂载到容器的路径'
nodeSelect: '选择任务的节点亲和性'
# all 为所有节点分配，资源不足时分配虚拟节点
# physical 只分配物理节点
# 填写具体节点的名称
```
