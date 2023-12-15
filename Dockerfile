FROM openjdk:17-jdk-slim
RUN apt update -y && apt install -y
WORKDIR /app
USER 1000
COPY --chown=1000:1000 target/greetings-0.0.1-SNAPSHOT.jar /app/greetings-0.0.1-SNAPSHOT.jar
CMD ["java","-jar","/app/greetings-0.0.1-SNAPSHOT.jar"]