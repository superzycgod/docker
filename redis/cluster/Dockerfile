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