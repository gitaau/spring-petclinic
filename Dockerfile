FROM java:8
WORKDIR /
LABEL  maintainer="gitaau@gmail.com"
ADD  /target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar 
CMD java -jar spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar --database=mysql --spring.datasource.url=jdbc:mysql://db/${MYSQL_DATABASE} --spring.datasource.username=root --spring.datasource.password=${MYSQL_ROOT_PASSWORD}

