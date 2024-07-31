# Use a imagem base do OpenJDK JDK
FROM openjdk:17 AS builder

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos do projeto
COPY . .

# Construa o projeto usando Maven (ou a ferramenta de build que você estiver usando)
RUN ./mvnw package

# Use a imagem base do OpenJDK JRE
FROM openjdk:17

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos construídos do estágio anterior
COPY --from=builder /app/target/*.jar app.jar

# Comando para executar o aplicativo
ENTRYPOINT ["java", "-jar", "app.jar"]
