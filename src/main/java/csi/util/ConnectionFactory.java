package csi.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("Driver carregado!");


            String dbHost = System.getenv("HOST") != null ? System.getenv("HOST") : "localhost";
            String dbPort = System.getenv("PORT") != null ? System.getenv("PORT") : "5432";
            String dbName = System.getenv("NAME") != null ? System.getenv("NAME") : "tarefas";
            String dbUser = System.getenv("USER") != null ? System.getenv("USER") : "postgres";
            String dbPass = System.getenv("PASS") != null ? System.getenv("PASS") : "2016010124";


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
