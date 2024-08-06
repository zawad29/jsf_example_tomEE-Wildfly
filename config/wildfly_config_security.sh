CMD="/subsystem=undertow/application-security-domain=other:write-attribute(name=integrated-jaspi, value=false)"
$WILDFLY_HOME/bin/jboss-cli.sh --connect --commands="$CMD"