FROM openjdk:17-jdk-slim-buster
RUN \
    apk update \
    && addgroup -S -g 1000 appgroup \
    && adduser -S -u 1000 -G appgroup appuser \
    && apk add tini bash

WORKDIR /app
USER 1000
COPY --chown=1000:1000 target/greetings-0.0.1-SNAPSHOT.jar /app/greetings-0.0.1-SNAPSHOT.jar
CMD ["java","-jar","/app/greetings-0.0.1-SNAPSHOT.jar"]