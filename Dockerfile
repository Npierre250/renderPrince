# Build Stage
FROM maven:3.8.5-openjdk-17 AS build

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src src
RUN mvn clean package -DskipTests

# Run Stage
FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar /app/application.jar

# Command to run your application
CMD ["java", "-jar", "application.jar"]
