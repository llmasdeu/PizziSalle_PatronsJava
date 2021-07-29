package model;

/**
 * Classe encarregada de gestionar els ingredients.
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
public class Ingredient {
    private String name;
    private int units;

    /**
     * Constructor de la classe encarregada de gestionar els ingredients.
     * @param name Nom de l'ingredient.
     */
    public Ingredient(String name) {
        this.name = name;
        this.units = 0;
    }

    /**
     * Getter del nom de l'ingredient.
     * @return Nom de l'ingredient.
     */
    public String getName() {
        return name;
    }

    /**
     * Getter de les unitats de l'ingredient.
     * @return Unitats de l'ingredient.
     */
    public int getUnits() {
        return units;
    }

    /**
     * Setter de les unitats de l'ingredient.
     * @param units Unitats de l'ingredient.
     */
    public void setUnits(int units) {
        this.units = units;
    }

    /**
     * Funció encarregada d'incrementar les unitats de l'ingredient.
     */
    public void incrementUnits() {
        this.units++;
    }
}
