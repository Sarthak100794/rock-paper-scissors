FROM tomcat:8.0
RUN touch /usr/local/tomcat/test.txt
COPY /target/roshambo.war /usr/local/tomcat/webapps/
