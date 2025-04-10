# Dockerfile for Spring Boot Backend
FROM maven:3.8-openjdk-17 AS build
WORKDIR /app

# Copy the pom.xml file
COPY pom.xml .

# Download all required dependencies
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Use a smaller JRE image for runtime
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the built jar file from the build stage
COPY --from=build /app/target/backend-0.0.1-SNAPSHOT.jar app.jar

# Expose the port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]