package controller;

import model.*;

import java.util.Scanner;

/**
 * Classe encarregada de gestionar la pizzeria.
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
public class PizzaShop {
    private String delegation;

    /**
     * Constructor de la pizzeria.
     * @param delegation Nom de la delegació de la pizzeria.
     */
    public PizzaShop(String delegation) {
        this.delegation = delegation;
    }

    /**
     * Funció encarregada de gestionar la pizzeria.
     */
    public void mainMenu() {
        String option;
        boolean exit = false;
        Scanner scr = new Scanner(System.in);

        do {
            System.out.println("\n\t----- PizziSalle (" + delegation + ") -----\n");
            System.out.println("1. Encarregar una comanda");
            System.out.println("2. Sortir\n");
            System.out.print("Escull una opció: ");
            option = scr.nextLine();

            switch (option) {
                case "1":
                    Order order = new Order(delegation);

                    order.manageOrder();
                    order.viewOrder();
                    break;

                case "2":
                    System.out.println("Gràcies per haver utilitzat aquest servei. Adéu!");
                    exit = true;
                    break;

                default:
                    System.out.println("Error! La opció seleccionada no existeix.");
                    break;
            }
        } while (!exit);
    }
}
