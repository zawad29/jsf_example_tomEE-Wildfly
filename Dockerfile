FROM tomee:ubuntu-plume
LABEL authors="dsi"

USER root

# Set environment variables
ENV DB_DRIVER=org.postgresql.Driver
ENV DB_URL=jdbc:postgresql://localhost:5432/todojsf
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=postgres

# Copy the application WAR file
COPY target/app.war /usr/local/tomee/webapps/
# Copy the PostgreSQL JDBC driver
COPY config/postgresql-42.7.3.jar /usr/local/tomee/lib/
# Copy db configuration
ADD config/tomee.xml /usr/local/tomee/conf/
# Copy tomcat user config
ADD config/tomcat-users.xml /usr/local/tomee/conf/

CMD ["catalina.sh", "run"]

EXPOSE 8080


