FROM maven:3.6.3-openjdk-11-slim as builder

WORKDIR /app
COPY pom.xml .
COPY src ./src

# Build a release artifact.
RUN mvn package -DskipTests

FROM openjdk:11.0.7-jre-slim

# Copy the jar to the production image from the builder stage.
COPY --from=builder /app/target/logging.problem-1.0-SNAPSHOT-jar-with-dependencies.jar /logging.problem-1.0-SNAPSHOT.jar

# Run the web service on container startup.
CMD ["java","-jar","/logging.problem-1.0-SNAPSHOT.jar"]