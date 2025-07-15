#Etapa 1: Compilar el proyecto con Maven y JDK 21
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app

# Copiar archivos del proyecto
COPY pom.xml .
COPY src ./src

#Descargar dependencias y compilar el JAR
RUN mvn clean package -DskipTests

# Verifica que el jar se genera
RUN ls -lh target/*.jar

#Etapa 2: Imagen liviana con solo el JAR y JRE 21
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copiar el JAR desde la etapa de build
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto de Config Server
EXPOSE 8888

# Variables que necesita quedan documentados
ENV GITHUB_TOKEN=""
ENV SERVER_PORT=8888
ENV GIT_REPO_URI=https://github.com/byronsegovia/ecosistema-config-server
ENV GIT_BRANCH=main
ENV GIT_USERNAME=yagodeoz
ENV GITHUB_TOKEN=sdsd

# Comando para ejecutar la aplicación
ENTRYPOINT ["sh", "-c", "env && java -jar app.jar"]

