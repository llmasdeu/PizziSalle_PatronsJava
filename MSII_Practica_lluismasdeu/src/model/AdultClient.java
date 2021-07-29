package model;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * Classe encarregada de gestionar les dades d'un client adult.
 * Patró utilitzat: Factory Method
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
public class AdultClient extends Client {
    private static final int MAX_DRINKS = 10;

    private Water water;
    private Soda soda;
    private Beer beer;

    /**
     * Constructor d'un client major d'edat.
     * @param name Nom del client.
     * @param phoneNumber Número de telèfon del client.
     * @param deliveryAddress Adreça d'enviament del client.
     * @param previouslyOrdered El client ha fet alguna comanda prèviament?
     */
    public AdultClient(String name, String phoneNumber, String deliveryAddress, boolean previouslyOrdered) {
        super(name, phoneNumber, deliveryAddress, previouslyOrdered);

        // Patró utilitzat: Facade
        this.water = new Water();
        this.soda = new Soda();
        this.beer = new Beer();
    }

    /**
     * Funció encarregada d'obtenir les begudes de la comanda.
     * @return Begudes de la comanda.
     */
    @Override
    ArrayList<Drink> getDrinks() {
        String option;
        boolean exit = false;
        Scanner scr = new Scanner(System.in);
        ArrayList<Drink> drinks = new ArrayList<>();

        do {
            System.out.println("\n\t----- Begudes -----\n");
            System.out.println("1. Aigua");
            System.out.println("2. Refresc");
            System.out.println("3. Cervesa");
            System.out.println("4. Sortir del menú d'elecció de begudes\n");
            System.out.print("Escull una beguda: ");
            option = scr.nextLine();

            if (option.equalsIgnoreCase("1") && !maxDrinksExceeded()) {
                water.incrementUnits();
            } else if (option.equalsIgnoreCase("1") && maxDrinksExceeded()) {
                System.out.println("Error! S'ha excedit el nombre màxim permès de begudes per comanda.");
            } else if (option.equalsIgnoreCase("2") && !maxDrinksExceeded()) {
                soda.incrementUnits();
            } else if (option.equalsIgnoreCase("2") && maxDrinksExceeded()) {
                System.out.println("Error! S'ha excedit el nombre màxim permès de begudes per comanda.");
            } else if (option.equalsIgnoreCase("3") && !maxDrinksExceeded()) {
                beer.incrementUnits();
            } else if (option.equalsIgnoreCase("3") && maxDrinksExceeded()) {
                System.out.println("Error! S'ha excedit el nombre màxim permès de begudes per comanda.");
            } else if (option.equalsIgnoreCase("4")) {
                exit = true;
            } else {
                System.out.println("Error! La opció seleccionada no és correcta.");
            }
        } while (!exit);

        drinks.add(water);
        drinks.add(soda);
        drinks.add(beer);

        return drinks;
    }

    /**
     * Funció encarregada de veure les dades del client.
     */
    @Override
    public void viewClient() {
        System.out.println("\t===== Client =====\n");
        System.out.println("Nom: " + name);
        System.out.println("Phone number: " + phoneNumber);
        System.out.println("Adreça d'enviament: " + deliveryAddress);

        if (previouslyOrdered) {
            System.out.println("Client reincident? Sí\n");
        } else {
            System.out.println("Client reincident? No\n");
        }
    }

    /**
     * Funció encarregada de comprovar si s'ha excedit el nombre màxim de begudes permeses per comanda.
     * @return CERT si s'ha excedit. FALS en cas contrari.
     */
    private  boolean maxDrinksExceeded() {
        return water.getUnits() + soda.getUnits() + beer.getUnits() >= MAX_DRINKS;
    }
}
