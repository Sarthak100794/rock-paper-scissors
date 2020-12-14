FROM bitnami/tomcat
COPY /target/roshambo.war /opt/bitnami/tomcat/webapps/
