# ENV Variables
DB_NAME=testDS1212d
DB_DRIVER=postgres
DB_JNDI_NAME=java:/jdbc/MyPostgresDS123123e
DB_URL=jdbc:postgresql://localhost:5432/todojsf
DB_USER=postgres
DB_PASSWORD=postgres


# Create Postgres DB Module
DB_MODULE_CMD="module add --name=org.postgres --resources=postgresql-42.7.3.jar --dependencies=javax.api,javax.transaction.api"
$WILDFLY_HOME/bin/jboss-cli.sh --connect --commands="$DB_MODULE_CMD"

# Register the DB in datasource subsystem
DB_REGISTER_CMD="/subsystem=datasources/jdbc-driver=postgres:add(driver-name="postgres",driver-module-name="org.postgres",driver-class-name=org.postgresql.Driver)"
$WILDFLY_HOME/bin/jboss-cli.sh --connect --commands="$DB_REGISTER_CMD"

# Create Datasource
DS_CONFIG_CMD="data-source add --name=$DB_NAME --jndi-name=$DB_JNDI_NAME --driver-name=postgres --connection-url=$DB_URL --user-name=$DB_USER --password=$DB_PASSWORD"
$WILDFLY_HOME/bin/jboss-cli.sh --connect --commands="$DS_CONFIG_CMD"


