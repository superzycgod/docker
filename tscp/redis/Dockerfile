FROM redis
COPY redis.conf /usr/local/etc/redis/redis.conf
RUN echo "Asia/Shanghai" > /etc/timezone
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
