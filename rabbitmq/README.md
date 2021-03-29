
# 创建并启动容器
docker run -d --hostname my-rabbit --name my-rabbit -p 15672:15672 -p 5672:5672 -p 61613:61613 rabbitmq_stomp
