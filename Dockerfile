FROM openjdk:8u212-jdk-slim
VOLUME /tmp
EXPOSE 8080

ARG JAR_FILE=target/gs-spring-boot-0.1.0.jar 
# Add the application's jar to the container
ADD ${JAR_FILE} gs-spring-boot-0.1.0.jar
# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/gs-spring-boot-0.1.0.jar"]