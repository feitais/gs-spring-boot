FROM openjdk:8
RUN mkdir /usr/app
RUN chmod 777 /usr/app
WORKDIR /usr/app
ADD gs-spring-boot-0.0.1.jar /usr/app/gs-spring-boot-0.0.1.jar
