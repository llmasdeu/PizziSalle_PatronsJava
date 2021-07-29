package model;

/**
 * Classe encarregada de gestionar els refrescs.
 * Patró utilitzat: Facade
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
public class Soda implements Drink {
    private int units;

    /**
     * Constructor de la classe encarregada de gestionar els refrescs.
     */
    public Soda() {
        this.units = 0;
    }

    /**
     * Funció encarregada d'incrementar les unitats del refresc.
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
        return "Refresc";
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
