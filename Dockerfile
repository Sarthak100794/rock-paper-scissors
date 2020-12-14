FROM bitnami/tomcat
COPY /var/jenkins_home/workspace/t/target/roshambo.war /opt/bitnami/tomcat/webapps/
