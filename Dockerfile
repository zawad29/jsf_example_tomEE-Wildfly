FROM tomee:ubuntu-plume
LABEL authors="dsi"

# Set environment variables
ENV DB_DRIVER=org.postgresql.Driver
ENV DB_URL=jdbc:postgresql://localhost:5432/todojsf
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=postgres

# Copy the application WAR file
COPY target/myapp.war /usr/local/tomee/webapps/