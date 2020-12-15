FROM tomcat:8.0
COPY /target/roshambo.war /usr/local/tomcat/webapps/
