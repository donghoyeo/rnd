# 1️⃣ 빌드 단계
FROM gradle:8.14.4-jdk17 AS builder
WORKDIR /rnd

COPY build.gradle settings.gradle gradlew ./
COPY gradle gradle
RUN gradle build -x test --no-daemon || true

COPY . .
RUN gradle build -x test --no-daemon

# 2️⃣ 실행 단계
FROM eclipse-temurin:17-jre
WORKDIR /rnd

COPY --from=builder /rnd/build/libs/*.jar app.jar

EXPOSE 8085
ENTRYPOINT ["java", "-jar", "app.jar"]
