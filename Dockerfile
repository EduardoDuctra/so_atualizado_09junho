
#Multi-Stage Build
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /usuario-tarefa

RUN git clone https://github.com/EduardoDuctra/so_atualizado_09junho.git .

RUN mvn clean package -DskipTests



#Execução Wildfly. O entrypoint já vem embutido nessa imagem mais nova do Wildfly. Não preciso colocar
FROM quay.io/wildfly/wildfly:36.0.1.Final-jdk21

COPY --from=build /usuario-tarefa/target/usuario_tarefa.war /opt/jboss/wildfly/standalone/deployments/

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

EXPOSE 8080


