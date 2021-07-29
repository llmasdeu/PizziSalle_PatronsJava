package controller;

import model.Ingredient;
import model.Pizza;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Classe encarregada de gestionar les connexions amb la base de dades.
 * Patró utilitzat: Singleton.
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 28/12/2019
 */
public class DBConnector {
    private static final String USERNAME = "username";
    private static final String PASSWORD = "password";
    private static final String DB_NAME = "pizzisalledb";
    private static final int DB_PORT = 3306;

    private static DBConnector instance = null;
    private static String userName;
    private static String password;
    private static String db;
    private static int port;
    private static String url = "jdbc:mysql://localhost";           // jdbc:mysql://127.0.0.1:3306/?user=root
    private static Connection connection = null;
    private static Statement statement;

    /**
     * Constructor de la classe encarregada de la gestió de la base de dades.
     */
    private DBConnector() {
        this.userName = USERNAME;
        this.password = PASSWORD;
        this.db = DB_NAME;
        this.port = DB_PORT;
        this.url += ":" + port + "/";
        this.url += db;
    }

    /**
     * Getter de la instància singleton de la classe encarregada de gestionar la base de dades.
     * @return Instància de la classe encarregada de gestionar la base de dades.
     */
    public static DBConnector getInstance() {
        if (instance == null)
            instance = new DBConnector();

        return instance;
    }

    /**
     * Funció encarregada de connectar el programa amb la base de dades.
     */
    public void connectDB() {
        try {
            //Class.forName("com.mysql.jdbc.Connection");
            connection = (Connection) DriverManager.getConnection(url, userName, password);

            if (connection != null) {
                System.out.println("Conexió a base de dades " + url + " ... Ok");
            }
        } catch(SQLException ex) {
            System.out.println("Problema al connecta-nos a la BBDD --> " + url);
        }
    }

    /**
     * Funció encarregada de desconnectar el programa de la base de dades.
     */
    public void disconnectDB() {
        try {
            connection.close();
        } catch (SQLException e) {
            System.out.println("Problema al tancar la connexió --> " + e.getSQLState());
        }
    }

    /**
     * Funció encarregda d'obtenir el llistat de pizzes disponibles segons la delegació.
     * @param delegation Delegació de la pizzeria.
     * @return Llistat de pizzes disponibles.
     */
    public ArrayList<Pizza> getPizzasByDelegation(String delegation) {
        ArrayList<Pizza> pizzas = new ArrayList<>();
        ArrayList<Ingredient> ingredients = new ArrayList<>();
        String query = "SELECT name FROM ingredients", pizzaName;
        ResultSet result = selectQuery(query), result2;

        try {
            while (result.next()) {
                Ingredient auxIngredient = new Ingredient(result.getString("name"));
                ingredients.add(auxIngredient);
            }

            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        query = "SELECT p.name AS pizzaName FROM delegations d, pizzas p, delegationspizzas dp WHERE p.id = dp.pizzaid AND dp.delegationid = d.id AND d.name LIKE \'" + delegation + "\'";

        try {
            result = selectQuery(query);

            while (result.next()) {
                pizzaName = result.getString("pizzaName");
                Pizza auxPizza = new Pizza(pizzaName, ingredients);
                query = "SELECT i.name AS ingredientName FROM ingredients i, pizzas p, pizzasingredients pi WHERE i.id = pi.ingredientid AND pi.pizzaid = p.id AND p.name LIKE \'" + pizzaName + "\'";
                result2 = selectQuery(query);

                while (result2.next()) {
                    auxPizza.addIngredient(result2.getString("ingredientName"));
                }

                pizzas.add(auxPizza);
                result2.close();
            }

            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pizzas;
    }

    /**
     * Funció encarregada de dur a terme una cerca a la base de dades.
     * @param query Cerca a dur a terme.
     * @return Resultat de la cerca.
     */
    private ResultSet selectQuery(String query) {
        ResultSet result = null;

        try {
            statement = (Statement) connection.createStatement();
            result = statement.executeQuery (query);
        } catch (SQLException ex) {
            System.out.println("Problema al Recuperar les dades --> " + ex.getSQLState());
        }

        return result;
    }

    /**
     * Funció encarregada de dur a terme una inserció a la base de dades.
     * @param query Inserció a dur a terme.
     */
    private void insertQuery(String query) {
        try {
            statement = (Statement) connection.createStatement();
            statement.executeUpdate(query);
        } catch (SQLException ex) {
            System.out.println("Problema al Inserir --> " + ex.getSQLState());
        }
    }

    /**
     * Funció encarregada de dur a terme una actualització a la base de dades.
     * @param query Actualització a dur a terme.
     */
    private void updateQuery(String query) {
        try {
            statement = (Statement) connection.createStatement();
            statement.executeUpdate(query);
        } catch (SQLException ex) {
            System.out.println("Problema al Modificar --> " + ex.getSQLState());
        }
    }

    /**
     * Funció encarregada de dur a terme un esborrat a la base de dades.
     * @param query Esborrat a dur a terme.
     */
    private void deleteQuery(String query) {
        try {
            statement = (Statement) connection.createStatement();
            statement.executeUpdate(query);
        } catch (SQLException ex) {
            System.out.println("Problema al Eliminar --> " + ex.getSQLState());
        }
    }
}
