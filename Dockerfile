FROM openjdk:17-jdk-slim
WORKDIR /app
USER 1000
COPY --chown=1000:1000 target/greetings-0.0.1-SNAPSHOT.jar /app/greetings-0.0.1-SNAPSHOT.jar
CMD ["java","-jar","/app/greetings-0.0.1-SNAPSHOT.jar"]