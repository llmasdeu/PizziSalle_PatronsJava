package model;

import controller.DBConnector;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * Classe encarregada de gestionar una comanda.
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
public class Order {
    private static final int MAX_PIZZAS = 10;

    private String delegation;
    private ArrayList<Pizza> pizzaModels;
    private Client client;
    private ArrayList <Pizza> pizzas;
    private ArrayList<Drink> drinks;

    /**
     * Constructor de la classe encarregada de gestionar una comanda.
     * @param delegation Delegació a on es duu a terme la comanda.
     */
    public Order(String delegation) {
        this.delegation = delegation;
        this.pizzaModels = DBConnector.getInstance().getPizzasByDelegation(delegation);
    }

    /**
     * Funció encarregada de gestionar la comanda.
     */
    public void manageOrder() {
        this.client = manageClient();
        this.pizzas = managePizzas();
        this.drinks = client.getDrinks();
    }

    /**
     * Funció encarregada de gestionar les dades del client.
     * @return Dades del client.
     */
    private Client manageClient() {
        Client client = null;
        String aux, name = "", phoneNumber, address;
        boolean error = true, adult = false, previousClient = false;
        Scanner scr = new Scanner(System.in);

        System.out.println("\n\t----- Dades del client -----\n");

        // Demanem el nom del client
        do {
            System.out.print("Nom: ");
            name = scr.nextLine();

            if (!name.equalsIgnoreCase("")) {
                error = false;
            } else {
                System.out.println("Error! No has indicat un nom vàlid.\n");
            }
        } while (error);

        error = true;

        // Demanem el número de telèfon del client
        do {
            System.out.print("\nTelèfon: ");
            phoneNumber = scr.nextLine();

            if (!phoneNumber.equalsIgnoreCase("")) {
                error = false;
            } else {
                System.out.println("Error! No has indicat un número de telèfon vàlid.\n");
            }
        } while (error);

        error = true;

        // Demanem l'adreça d'enviament del client
        do {
            System.out.print("\nAdreça d'enviament: ");
            address = scr.nextLine();

            if (!address.equalsIgnoreCase("")) {
                error = false;
            } else {
                System.out.println("Error! No has indicat una adreça d'enviament vàlida.\n");
            }
        } while (error);

        error = true;

        // És un client reincident?
        do {
            System.out.print("\nÉs un client reincident (S/N)? ");
            aux = scr.nextLine();

            if (aux.equalsIgnoreCase("S")) {
                previousClient = true;
                error = false;
            } else if (aux.equalsIgnoreCase("N")) {
                previousClient = false;
                error = false;
            } else {
                System.out.println("Error! No has indicat una opció vàlida.\n");
            }
        } while (error);

        error = true;

        // És un client major d'edat?
        do {
            System.out.print("\nEl client és major d'edat (S/N)? ");
            aux = scr.nextLine();

            if (aux.equalsIgnoreCase("S")) {
                adult = true;
                error = false;
            } else if (aux.equalsIgnoreCase("N")) {
                adult = false;
                error = false;
            } else {
                System.out.println("Error! No has indicat una opció vàlida.\n");
            }
        } while (error);

        // Creem la instància amb les dades del client
        if (adult) {
            client = new AdultClient(name, phoneNumber, address, previousClient);
        } else {
            client = new YoungClient(name, phoneNumber, address, previousClient);
        }

        return client;
    }

    /**
     * Funció encarregada de gestionar les pizzes de la comanda.
     * @return Pizzes de la comanda.
     */
    private ArrayList<Pizza> managePizzas() {
        int i, optionAux;
        Pizza chosenPizza, auxPizza;
        String option;
        boolean exit = false;
        Scanner scr = new Scanner(System.in);
        ArrayList<Pizza> orderPizzas = new ArrayList<Pizza>();

        do {
            System.out.println("\n\t----- Pizzes -----\n");

            for (i = 0; i < pizzaModels.size(); i++) {
                System.out.println((i + 1) + ". " + pizzaModels.get(i).getName());
            }

            System.out.println((pizzaModels.size() + 1) + ". Sortir del menú d'elecció de les pizzes\n");
            System.out.print("Quin model vols escollir? ");
            option = scr.nextLine();

            // Convertim la opció escollida en enter
            optionAux = convertStringToInteger(option);

            // Comprovem les diferents casuístiques
            if (optionAux >= 1 && optionAux <= pizzaModels.size() && orderPizzas.size() < MAX_PIZZAS) {
                chosenPizza = pizzaModels.get(optionAux - 1);
                auxPizza = chosenPizza.clonePizza();
                auxPizza.defineProperties();
                orderPizzas.add(auxPizza);
            } else if (optionAux >= 1 && optionAux <= pizzaModels.size() && orderPizzas.size() >= MAX_PIZZAS) {
                System.out.println("\nError! S'ha superat el màxim de pizzes per comanda permès.");
            } else if (optionAux == pizzaModels.size() + 1) {
                exit = true;
            } else {
                System.out.println("\nError! La opció seleccionada no és correcta.");
            }
        } while (!exit);

        return orderPizzas;
    }

    /**
     * Funció encarregada de convertir una String en un enter.
     * @param toConvert String a convertir.
     * @return String convertida en enter.
     */
    private int convertStringToInteger(String toConvert) {
        int i, converted = 0;
        boolean error = false;

        for (i = 0; i < toConvert.length() && !error; i++) {
            if (toConvert.charAt(i) >= '0' && toConvert.charAt(i) <= '9') {
                converted = (converted * 10) + (toConvert.charAt(i) - '0');
            } else {
                error = true;
                converted = -1;
            }
        }

        return converted;
    }

    /**
     * Funció encarregada de veure les dades de la comanda.
     */
    public void viewOrder() {
        int i;

        System.out.println("\n\t----- Comanda -----");
        client.viewClient();
        System.out.println("\t===== Pizzes =====");

        for (i = 0; i < pizzas.size(); i++) {
            pizzas.get(i).viewPizza();
        }

        System.out.println("\t===== Begudes =====\n");

        for (i = 0; i < drinks.size(); i++) {
            System.out.println("- " + drinks.get(i).getName() + " ( " + drinks.get(i).getUnits() + " unitats)");
        }
    }
}
