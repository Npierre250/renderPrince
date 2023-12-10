# Build Stage
FROM maven:3.8.5-openjdk-17 AS build

COPY . .
RUN mvn clean package -DskipTests

# Run Stage
FROM openjdk:17.0.1-jdk-slim

COPY --from=build /target/SPRINGBOOT-0.0.1-SNAPSHOT.jar /app/SPRINGBOOT.jar

# Command to run your application
CMD ["java", "-jar", "SPRINGBOOT.jar"]
