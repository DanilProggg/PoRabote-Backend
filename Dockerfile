# The source repo ships without a Dockerfile; this is a minimal build/run
# setup for local docker-compose use only. Build context is the "forwork"
# Maven module inside this repo.

FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /build
COPY forwork/pom.xml .
RUN mvn -q -B dependency:go-offline
COPY forwork/src ./src
RUN mvn -q -B clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /build/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
