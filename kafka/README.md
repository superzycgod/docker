# 可用性测试
> 自此，如果没有出现什么错误，通过docker ps 应该可以看到已经成功启动了一个zookeeper容器，两个Kafka容器。

## 通过指定容器名（假设容器名为 kafka1）进入一个Kafka容器:

docker exec -it kafka1 /bin/bash

## 查看已有的topic列表

$KAFKA_HOME/bin/kafka-topics.sh --zookeeper zoo1:2181 --list

## 发布消息:  （输入若干条消息后 按^C 退出发布）

$KAFKA_HOME/bin/kafka-console-producer.sh --topic=stream-in \
--broker-list kafka1:9092

## 接收消息:

$KAFKA_HOME/bin/kafka-console-consumer.sh \
--bootstrap-server kafka1:9092 \
--from-beginning --topic stream-in

如果接收到了发布的消息，证明整个部署正常，就可以正式开始开发工作了。

## 其他命令

## 查看主题
kafka-topics.sh --describe \
--bootstrap-server kafka1:9092 \
--topic stream-in

### 创建主题
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper zoo1:2181 --replication-factor 2 --partitions 3 --topic test1



