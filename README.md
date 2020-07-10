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
pvc: persistance-volumes-claims
image: docker-images
labels: MG00001
# 建议在命令行写的内容
cmd: "sleep 10s"
cpu: 1
memory: "10Mi"
```

