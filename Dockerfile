
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app


RUN git clone https://github.com/EduardoDuctra/so_atualizado_09junho.git .



RUN mvn clean package -DskipTests

FROM quay.io/wildfly/wildfly:36.0.1.Final-jdk21


COPY --from=build /app/target/usuario_tarefa.war /opt/jboss/wildfly/standalone/deployments/

