FROM bitnami/tomcat
COPY /var/jenkins_home/.m2/repository/com/mcnz/rps/web/roshambo/1.0/roshambo-1.0.war /opt/bitnami/tomcat/webapps/
