package model;

/**
 * Classe encarregada de gestionar una beguda.
 * Patró utilitzat: Facade
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
public interface Drink {
    public void incrementUnits();
    public String getName();
    public int getUnits();
}
