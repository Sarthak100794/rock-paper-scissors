FROM bitnami/tomcat
COPY /t/target/roshambo.war /opt/bitnami/tomcat/webapps/
