package controller;

import java.util.Scanner;

/**
 * Classe principal del programa.
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
public class PizziSalle {
    private static final String BARCELONA = "Barcelona";
    private static final String GIRONA = "Girona";
    private static final String TARRAGONA = "Tarragona";
    private static final String LLEIDA = "Lleida";

    /**
     * Funció principal del programa.
     * @param args Arguments d'execució del programa.
     */
    public static void main(String[] args) {
        DBConnector.getInstance().connectDB();
        System.out.println("\t----- Benvinguts a PizziSalle -----\n");
        PizzaShop pizzaShop = definePizzaShopDelegation();
        pizzaShop.mainMenu();
        DBConnector.getInstance().disconnectDB();
    }

    /**
     * Funció encarregada de seleccionar la delegació de la pizzeria.
     * @return Instància de la delegació de la pizzeria.
     */
    private static PizzaShop definePizzaShopDelegation() {
        boolean error = true;
        Scanner scr = new Scanner(System.in);
        String delegation = "";
        PizzaShop pizzaShop = null;

        do {
            System.out.println("Disposem de les següents delegacions:\n");
            System.out.println("\t* Barcelona");
            System.out.println("\t* Girona");
            System.out.println("\t* Tarragona");
            System.out.println("\t* Lleida\n");
            System.out.print("A quina delegació et trobes? ");
            delegation = scr.nextLine();

            if (delegation.equalsIgnoreCase(BARCELONA) || delegation.equalsIgnoreCase(GIRONA) ||
                delegation.equalsIgnoreCase(TARRAGONA) || delegation.equalsIgnoreCase(LLEIDA)) {
                error = false;

                if (delegation.equalsIgnoreCase(BARCELONA)) {
                    pizzaShop = new PizzaShop(BARCELONA);
                } else if (delegation.equalsIgnoreCase(GIRONA)) {
                    pizzaShop = new PizzaShop(GIRONA);
                } else if (delegation.equalsIgnoreCase(TARRAGONA)) {
                    pizzaShop = new PizzaShop(TARRAGONA);
                } else if (delegation.equalsIgnoreCase(LLEIDA)) {
                    pizzaShop = new PizzaShop(LLEIDA);
                }
            } else {
                System.out.println("\nError! La delegació indicada no és correcta!\n");
            }
        } while (error);

        return pizzaShop;
    }
}
