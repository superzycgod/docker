FROM tomcat:8.5.31
LABEL Name=tscp_tomcat Version=0.0.1
ADD ./tomcat/conf/Catalina/localhost/ /usr/local/tomcat/conf/Catalina/localhost/
ADD ./tomcat/conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
ADD ./tomcat/webapps/manager/WEB-INF/web.xml /usr/local/tomcat/manager/WEB-INF/web.xml
#ADD /etc/localtime /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone