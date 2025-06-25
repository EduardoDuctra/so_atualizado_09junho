package csi.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("Driver carregado!");


            String dbHost = "db";
            String dbPort = "5432";
            String dbName = "tarefas";
            String dbUser = "postgres";
            String dbPass = "2016010124";

            String url = "jdbc:postgresql://" + dbHost + ":" + dbPort + "/" + dbName;

            System.out.println("Conectando a: " + url);

            return DriverManager.getConnection(url, dbUser, dbPass);

        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver do PostgreSQL não encontrado", e);
        } catch (SQLException e) {
            throw new SQLException("Erro ao conectar ao banco de dados", e);
        }
    }
}
