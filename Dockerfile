# Stage 1: Build Stage
FROM openjdk:20-jdk-slim as buildstage

# Set working directory
WORKDIR /app

# Copy Maven wrapper and configuration files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Download dependencies
RUN ./mvnw dependency:go-offline

# Copy application source code
COPY src src

# Build the application, skipping tests
RUN ./mvnw package -Dmaven.test.skip=true

# Stage 2: Runtime Stage
FROM openjdk:20-jdk-slim

# Set working directory
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=buildstage /app/target/demo-0.0.1-SNAPSHOT.jar /app/app.jar

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
