FROM redis
RUN echo "Asia/Shanghai" > /etc/timezone
RUN mkdir -p /usr/local/etc/redis/
RUN echo "sentinel monitor mymaster 192.168.177.128 6000 1" >  /usr/local/etc/redis/sentinel.conf
RUN echo "sentinel down-after-milliseconds mymaster 60000" >> /usr/local/etc/redis/sentinel.conf
RUN echo "sentinel failover-timeout mymaster 180000" >> /usr/local/etc/redis/sentinel.conf
RUN echo "sentinel parallel-syncs mymaster 1" >> /usr/local/etc/redis/sentinel.conf
CMD [ "redis-sentinel", "/usr/local/etc/redis/sentinel.conf" ]