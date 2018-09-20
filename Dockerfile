FROM tomcat:8.0.20-jre8
USER root
COPY ~/workspace/test/web/target/time-tracker-web-0.3.1.war /usr/local/tomcat/webapps/
EXPOSE 80 
