# Build aşaması
FROM eclipse-temurin:21 AS builder
WORKDIR /app
COPY . .

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Final imaj
FROM eclipse-temurin:21
LABEL maintainer="senin@epostan.com"
WORKDIR /app
COPY --from=builder /app/target/demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
