package model;

/**
 * Classe encarregada de gestionar l'aigua.
 * Patró utilitzat: Facade
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
public class Water implements Drink {
    private int units = 0;

    /**
     * Constructor de la classe encarregada de gestionar l'aigua.
     */
    public Water() {
        this.units = 0;
    }

    /**
     * Funció encarregada d'incrementar les unitats de la beguda.
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
        return "Aigua";
    }

    /**
     * Getter de les unitats de la beguda.
     * @return Unitats de la beguda.
     */
    @Override
    public int getUnits() {
        return units;
    }
}
