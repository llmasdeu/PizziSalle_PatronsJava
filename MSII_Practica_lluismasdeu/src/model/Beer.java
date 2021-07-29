package model;

/**
 * Classe encarregada de gestionar les cerveses.
 * Patró utilitzat: Facade
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
public class Beer implements Drink {
    private int units;

    /**
     * Constructor de la classe encarregada de gestionar les cerveses.
     */
    public Beer() {
        this.units = 0;
    }

    /**
     * Funció encarregada d'incrementar les unitats de les cerveses.
     */
    @Override
    public void incrementUnits() {
        units++;
    }

    /**
     * Getter del nom de la beguda.
     * @return Nom de la beguda.
     */
    @Override
    public String getName() {
        return "Cervesa";
    }

    /**
     * Getter del nombre d'unitats de la beguda.
     * @return Nombre d'unitats de la beguda.
     */
    @Override
    public int getUnits() {
        return units;
    }
}
