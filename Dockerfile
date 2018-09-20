FROM tomcat:8.0.20-jre8
USER root
COPY ./time-tracker-web-0.3.1.war /usr/local/tomcat/webapps/
EXPOSE 80 
