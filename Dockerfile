FROM tomcat:8.0
RUN touch healthy
COPY /target/roshambo.war /usr/local/tomcat/webapps/
