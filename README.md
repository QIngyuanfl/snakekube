# 2021/05/17
- 增加动态更改pod消耗资源的功能。
- 扫描频率降低以减少网络流量
# 2021/03/18
- 规定所有镜像的entrypoint 都为shell
# 2020/09/02 v1.10
- 增加--local 选项，等同于配置档中nodeSelct: physical
- 报错的pod 将自动删除，并在当前目录输出报错日志：{pod-name}.log

# snakekube
Turn snakemake jobs to kubernetes pods
## 使用方法:

```sh
snakekube -c $command -p $cpu -r $ram -s $pvc -m $image -f $config_file
```

# 动态更改pod的资源使用量
```sh
# pod_id 是kubectl get po 得到的Name列的信息
# cpu 是更改后的cpu使用量，单位为个
# ram 是更改后的内存使用量，单位为Mi/Gi

snakekube realloc -p $pod_id -c $cpu -r $ram 
```

## 使用场景
1. 集群资源剩余量小于任务申请的资源，导致任务处于Pending状态，可调小Pending的pod所申请的资源，促其运行。也可调小其他正在运行的pod所使用的资源，使集群剩余资源量增多。
2. 发现任务将要超出设定的内存了，可以通过该命令调大该pod使用的内存，避免out of memory。
3. 只支持投到物理节点的pod

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
