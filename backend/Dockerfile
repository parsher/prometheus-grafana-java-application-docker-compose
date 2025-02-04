FROM maven:3.9.9-eclipse-temurin-21-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
# Async Profiler install
RUN apt-get update && apt-get install -y wget unzip procps
RUN wget https://github.com/jvm-profiling-tools/async-profiler/releases/download/v2.9/async-profiler-2.9-linux-x64.tar.gz
RUN tar -xzf async-profiler-2.9-linux-x64.tar.gz -C /opt
ENV ASYNC_PROFILER_HOME /opt/async-profiler-2.9-linux-x64

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
