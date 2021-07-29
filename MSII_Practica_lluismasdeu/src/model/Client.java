package model;

import java.util.ArrayList;

/**
 * Classe encarregada de gestionar les dades d'un client.
 * Patró utilitzat: Factory Method
 * @author Lluís Masdeu (lluis.masdeu)
 * @date 27/12/2019
 */
abstract class Client {
    protected String name = "";
    protected String phoneNumber = "";
    protected String deliveryAddress = "";
    protected boolean previouslyOrdered = false;

    /**
     * Constructor de la classe encarregada de gestionar les dades d'un client.
     * @param name Nom del client.
     * @param phoneNumber Número de telèfon del client.
     * @param deliveryAddress Adreça d'enviament del client.
     * @param previouslyOrdered El client és reincident?
     */
    public Client(String name, String phoneNumber, String deliveryAddress, boolean previouslyOrdered) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.deliveryAddress = deliveryAddress;
        this.previouslyOrdered = previouslyOrdered;
    }

    /**
     * Funció encarregada d'obtenir les begudes de la comanda.
     * @return Begudes de la comanda.
     */
    abstract ArrayList<Drink> getDrinks();

    /**
     * Funció encarregada de veure les dades del client.
     */
    abstract void viewClient();
}
