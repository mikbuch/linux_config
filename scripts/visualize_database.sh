username="usr"
password="pass"
java -jar schemaSpy.jar -t pgsql -s public -db baza_palette -u $username -p $password -host localhost -o /tmp -dp postgresql-*.jar
