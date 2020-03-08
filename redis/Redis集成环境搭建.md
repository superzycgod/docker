

# 一、主从模式

## 1. master配置

master无需配置

## 2. slave配置

> slave默认为只读模式，只能进行查询操作；
>
> 通过修改replica-read-only=no参数，可配置成可写模式，但是为本地写入，不会同步到master中；

修改slave的配置文件，添加如下配置

```
slaveof host port
```

- `host`：master的ip地址
- `port`：master的端口号

> 也可以redis-cli登录到slave，执行REPLICAOF host port命令设置为slave

## 3. 缺陷

master挂掉后，需要人工将slave提升为master，无法做到高可用

# 二、哨兵模式

> 添加哨兵节点（建议最少3个哨兵），监控master状态，如果master节点挂掉，则从slave中选举一个节点为master继续提供服务

## 1. 哨兵配置

**创建配置文件sentinel.conf**

```
port 5000
sentinel monitor <master-group-name> <ip> <port> <quorum>
sentinel down-after-milliseconds <master-group-name> 5000
sentinel failover-timeout <master-group-name> 60000
sentinel parallel-syncs <master-group-name> 1
```

- `port`：哨兵节点对外服务端口号（默认26379）

- `master-group-name`：主节点名称

- `ip`：主节点IP地址

- `port`：主节点端口号

- `quorum`：同意master为不可达状态的哨兵数

  > 如果至少`quorum` 数量的哨兵同意的话，则认为master为客观宕机状态，哨兵集群选举一个哨兵作为leader，这个leader需要至少得到`majority`个哨兵授权后，才能进行故障转移操作（主从切换），否则无法进行故障转移操作

## 2. quorum和majority

[Redis的几个核心机制底层原理]: https://segmentfault.com/a/1190000020849841?utm_source=tag-newest	"quorum和majority"

1. 每次一个哨兵要做主备切换，首先需要quorum数量的哨兵认为O_DOWN，然后选举出一个哨兵来做切换，这个哨兵还得得到majority哨兵的授权，才能正式执行切换

2. 如果quorum < majority，比如5个哨兵，majority就是3，quorum设置为2，那么就3个哨兵授权就可以执行切换,但是如果quorum >= majority，那么必须quorum数量的哨兵都授权，比如5个哨兵，quorum是5，那么必须5个哨兵都同意授权，才能执行切换

## 3. 启动哨兵

```
redis-sentinel /path/to/sentinel.conf
```

# 三、cluster模式

## 1. 修改配置文件

```
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
appendonly yes
```

## 2. 启动集群

分别启动6个redis服务，端口号：7000-7005

这里使用docker-compose搭建集群，网络模式使用host

集成redis集群环境配置的Dockfile如下：

```
FROM redis
ARG port=6379
RUN mkdir -p /usr/local/etc/redis/
RUN echo "port $port" >  /usr/local/etc/redis/redis.conf
RUN echo "cluster-enabled yes" >> /usr/local/etc/redis/redis.conf
RUN echo "cluster-config-file nodes.conf" >> /usr/local/etc/redis/redis.conf
RUN echo "cluster-node-timeout 5000" >> /usr/local/etc/redis/redis.conf
RUN echo "appendonly yes" >> /usr/local/etc/redis/redis.conf
RUN echo "Asia/Shanghai" > /etc/timezone
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf"]
```

docker-compose.yml配置如下：

```
version: '2.1'

services:
  master1:
    network_mode: "host"
    container_name: cluster_master1
    image: redis/cluster_master_7000
    build:
      context: .
      args:
        - port=7000
  master2:
    network_mode: "host"
    container_name: cluster_master2
    image: redis/cluster_master_7001
    build:
      context: .
      args:
        - port=7001
  master3:
    network_mode: "host"
    container_name: cluster_master3
    image: redis/cluster_master_7002
    build:
      context: .
      args:
        - port=7002
  slave1:
    network_mode: "host"
    container_name: cluster_slave1
    image: redis/cluster_slave_7003
    build:
      context: .
      args:
        - port=7003
  slave2:
    network_mode: "host"
    container_name: cluster_slave2
    image: redis/cluster_slave_7004
    build:
      context: .
      args:
        - port=7004
  slave3:
    network_mode: "host"
    container_name: cluster_slave3
    image: redis/cluster_slave_7005
    build:
      context: .
      args:
        - port=7005
```



## 3.配置集群

**创建集群命令**

```
redis-cli --cluster create \
192.168.177.128:7000 192.168.177.128:7002 192.168.177.128:7004 \
192.168.177.128:7001 192.168.177.128:7003 192.168.177.128:7005 \
--cluster-replicas 1
```

进入任意一个docker容器，执行创建集群：

```
root@docker01:/data# redis-cli --cluster create \
> 192.168.177.128:7000 192.168.177.128:7002 192.168.177.128:7004 \
> 192.168.177.128:7001 192.168.177.128:7003 192.168.177.128:7005 \
> --cluster-replicas 1
>>> Performing hash slots allocation on 6 nodes...
Master[0] -> Slots 0 - 5460
Master[1] -> Slots 5461 - 10922
Master[2] -> Slots 10923 - 16383
Adding replica 192.168.177.128:7004 to 192.168.177.128:7000
Adding replica 192.168.177.128:7005 to 192.168.177.128:7002
Adding replica 192.168.177.128:7001 to 192.168.177.128:7004
>>> Trying to optimize slaves allocation for anti-affinity
[WARNING] Some slaves are in the same host as their master
M: a6a4db3f9c58705fca808adbdd5eef514b976cba 192.168.177.128:7000
   slots:[0-5460] (5461 slots) master
M: fc3825e36f4e5e77a4abb706c0324a5bf91a6d2b 192.168.177.128:7002
   slots:[5461-10922] (5462 slots) master
M: fe597d27cd6b05285e0be07e34f9a4af1bf56bfa 192.168.177.128:7004
   slots:[10923-16383] (5461 slots) master
S: 0c28064fd2479d47804a79c1ca9dbab261e31530 192.168.177.128:7001
   replicates a6a4db3f9c58705fca808adbdd5eef514b976cba
S: fe597d27cd6b05285e0be07e34f9a4af1bf56bfa 192.168.177.128:7004
   replicates fc3825e36f4e5e77a4abb706c0324a5bf91a6d2b
S: a55852ba9f8d45f06591a2770dd9404f3923fcb0 192.168.177.128:7005
   replicates fe597d27cd6b05285e0be07e34f9a4af1bf56bfa
Can I set the above configuration? (type 'yes' to accept): yes
>>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join
...
>>> Performing Cluster Check (using node 192.168.177.128:7000)
M: a6a4db3f9c58705fca808adbdd5eef514b976cba 192.168.177.128:7000
   slots:[0-5460] (5461 slots) master
   1 additional replica(s)
S: 0c28064fd2479d47804a79c1ca9dbab261e31530 192.168.177.128:7001
   slots: (0 slots) slave
   replicates a6a4db3f9c58705fca808adbdd5eef514b976cba
M: fc3825e36f4e5e77a4abb706c0324a5bf91a6d2b 192.168.177.128:7002
   slots:[5461-10922] (5462 slots) master
M: fe597d27cd6b05285e0be07e34f9a4af1bf56bfa 192.168.177.128:7004
   slots:[10923-16383] (5461 slots) master
   1 additional replica(s)
S: a55852ba9f8d45f06591a2770dd9404f3923fcb0 192.168.177.128:7005
   slots: (0 slots) slave
   replicates fe597d27cd6b05285e0be07e34f9a4af1bf56bfa
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
```

**查看集群节点信息**

> redis-cli -h docker01 -p 7000 cluster nodes

```
root@docker01:/data# redis-cli -h docker01 -p 7000 cluster nodes 
a6a4db3f9c58705fca808adbdd5eef514b976cba 192.168.177.128:7000@17000 myself,master - 0 1583597727000 1 connected 0-5460
0c28064fd2479d47804a79c1ca9dbab261e31530 192.168.177.128:7001@17001 slave a6a4db3f9c58705fca808adbdd5eef514b976cba 0 1583597727000 4 connected
fc3825e36f4e5e77a4abb706c0324a5bf91a6d2b 192.168.177.128:7002@17002 master - 0 1583597727548 2 connected 5461-10922
fe597d27cd6b05285e0be07e34f9a4af1bf56bfa 192.168.177.128:7004@17004 master - 0 1583597727549 3 connected 10923-16383
a55852ba9f8d45f06591a2770dd9404f3923fcb0 192.168.177.128:7005@17005 slave fe597d27cd6b05285e0be07e34f9a4af1bf56bfa 0 1583597728555 6 connected
```

可以看到，7000、7002、7004、为master节点，而7001、7003、7004则分别为其对应的slave节点

