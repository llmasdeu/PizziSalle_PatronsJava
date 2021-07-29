package model;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * Classe encarregada de gestionar la pizza.
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
public class Pizza {
    public static final String DEFAULT_MASS = "Original";
    public static final String THIN_MASS = "Fina";
    public static final String THICK_MASS = "Gruixuda";

    private String name;
    private ArrayList<Ingredient> ingredients;
    private String pizzaMass = "";

    /**
     * Constructor de la classe encarregada de gestionar la pizza.
     * @param name Nom de la pizza.
     * @param ingredients Ingredients de la pizza.
     */
    public Pizza(String name, ArrayList<Ingredient> ingredients) {
        this.name = name;
        this.ingredients = new ArrayList<Ingredient>();
        this.pizzaMass = DEFAULT_MASS;

        for (int i = 0; i < ingredients.size(); i++) {
            this.ingredients.add(new Ingredient(ingredients.get(i).getName()));
            this.ingredients.get(i).setUnits(ingredients.get(i).getUnits());
        }
    }

    /**
     * Getter del nom de la pizza.
     * @return Nom de la pizza.
     */
    public String getName() {
        return name;
    }

    /**
     * Getter dels ingredients de la pizza.
     * @return Ingredients de la pizza.
     */
    public ArrayList<Ingredient> getIngredients() {
        return ingredients;
    }

    /**
     * Getter del tipus de massa de la pizza.
     * @return Tipus de massa de la pizza.
     */
    public String getPizzaMass() {
        return pizzaMass;
    }

    /**
     * Funció encarregada d'afegir un ingredient a la pizza.
     * @param ingredient Ingredient a afegir.
     */
    public void addIngredient(String ingredient) {
        for (int i = 0; i < ingredients.size(); i++) {
            if (ingredient.equalsIgnoreCase(ingredients.get(i).getName())) {
                ingredients.get(i).incrementUnits();
            }
        }
    }

    /**
     * Funció encarregada de definir les propietats de la pizza.
     */
    public void defineProperties() {
        String option;
        boolean error = true;
        Scanner scr = new Scanner(System.in);

        do {
            System.out.println("\n\t----- " + name + " -----\n");
            System.out.print("El client desitja un tipus de massa concret? (S/N) ");
            option = scr.nextLine();

            if (option.equalsIgnoreCase("S")) {
                error = false;
                defineMassType();
            } else if (option.equalsIgnoreCase("N")) {
                error = false;
            } else {
                System.out.println("Error! La opció indicada no és correcta.");
            }
        } while (error);

        addIngredients();
    }

    /**
     * Funció encarregada de definir el tipus de massa de la pizza.
     */
    private void defineMassType() {
        String option;
        boolean error = true;
        Scanner scr = new Scanner(System.in);

        do {
            System.out.println("\n\t----- " + name + " - Tipus de massa -----\n");
            System.out.println("1. Original");
            System.out.println("2. Fina");
            System.out.println("3. Gruixuda\n");
            System.out.print("De quin tipus de massa vol el client la pizza? ");
            option = scr.nextLine();

            if (option.equalsIgnoreCase("1")) {
                pizzaMass = DEFAULT_MASS;
                error = false;
            } else if (option.equalsIgnoreCase("2")) {
                pizzaMass = THIN_MASS;
                error = false;
            } else if (option.equalsIgnoreCase("3")) {
                pizzaMass = THICK_MASS;
                error = false;
            } else {
                System.out.println("Error! La opció seleccionada no es troba disponible.");
            }

        } while (error);
    }

    /**
     * Funció encarregada d'afegir ingredients a la pizza.
     */
    private void addIngredients() {
        int i, optionAux;
        String option;
        Scanner scr = new Scanner(System.in);
        boolean exit = false;

        do {
            System.out.println("\n\t----- " + name + " - Ingredients -----\n");

            for (i = 0; i < ingredients.size(); i++) {
                System.out.println((i + 1) + ". " + ingredients.get(i).getName() + " (" + ingredients.get(i).getUnits() + " unitats)");
            }

            System.out.println((ingredients.size() + 1) + ". Sortir del menú d'elecció dels ingredients de la pizza\n");
            System.out.print("Quin ingredient vols escollir? ");
            option = scr.nextLine();

            // Convertim la opció escollida en enter
            optionAux = convertStringToInteger(option);

            // Comprovem les diferents casuístiques
            if (optionAux >= 1 && optionAux <= ingredients.size()) {
                ingredients.get(optionAux - 1).incrementUnits();
            } else if (optionAux == ingredients.size() + 1) {
                exit = true;
            } else {
                System.out.println("\nError! La opció seleccionada no és correcta.");
            }
        } while (!exit);
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
     * Funció encarregada de clonar un objecte de la classe Pizza.
     * @return Objecte clonat de la classe Pizza.
     */
    public Pizza clonePizza() {
        int i, j;
        ArrayList<Ingredient> newIngredients = new ArrayList<>();

        for (i = 0; i < ingredients.size(); i++) {
            newIngredients.add(new Ingredient(ingredients.get(i).getName()));
            newIngredients.get(i).setUnits(ingredients.get(i).getUnits());
        }

        Pizza auxPizza = new Pizza(this.name, newIngredients);

        return auxPizza;
    }

    /**
     * Funció encarregada de veure les dades de la pizza.
     */
    public void viewPizza() {
        System.out.println("\t***** " + name + " *****\n");
        System.out.println("- Tipus de massa: " + pizzaMass);

        for (int i = 0; i < ingredients.size(); i++) {
            if (ingredients.get(i).getUnits() > 0) {
                System.out.println("- " + ingredients.get(i).getName() + " (" + ingredients.get(i).getUnits() + " unitats)");
            }
        }

        System.out.println("");
    }
}
