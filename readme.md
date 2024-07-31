### Config JPA
- Download Postgres Jar file and copy into tomee_home/lib folder
- edit the tomeee_home/conf/tomee.xml file and add db resource info
    ```
      <Resource id="jdbc/postgres" type="DataSource">
        JdbcDriver org.postgresql.Driver
        JdbcUrl jdbc:postgresql://localhost:5432/todojsf
        JtaManaged  true
        LogSql  true
        UserName postgres
        Password postgres
    </Resource>
  ``` 
- Edit the persistance.xml file
    ```
  <persistence-unit name="pg">
        <jta-data-source>jdbc/postgres</jta-data-source>
        <properties>
            <property name="jakarta.persistence.schema-generation.database.action" value="create"/>
        </properties>
    </persistence-unit>
  ```
### Used Intellij and TomEE plugin for development and deployment