# Mostrem totes les bases de dades.
SHOW DATABASES;

# Esborrem, si existeix, la base de dades.
DROP DATABASE IF EXISTS pizzisalledb;

# Creem, si no existeix, la base de dades.
CREATE DATABASE IF NOT EXISTS pizzisalledb CHARACTER SET utf8 COLLATE utf8_general_ci;

# Seleccionem la base de dades.
USE pizzisalledb;

# Taules
## Taula de delegacions
DROP TABLE IF EXISTS delegations;

CREATE TABLE IF NOT EXISTS delegations(
	id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL DEFAULT '' UNIQUE,
    PRIMARY KEY(id)
) ENGINE InnoDB;

INSERT INTO delegations(name) VALUES('Barcelona');
INSERT INTO delegations(name) VALUES('Girona');
INSERT INTO delegations(name) VALUES('Tarragona');
INSERT INTO delegations(name) VALUES('Lleida');

SELECT * FROM delegations;

## Taula de pizzes
DROP TABLE IF EXISTS pizzas;

CREATE TABLE IF NOT EXISTS pizzas(
	id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL DEFAULT '' UNIQUE,
    ingredients INT NOT NULL DEFAULT 0,
    PRIMARY KEY(id)
) ENGINE InnoDB;

INSERT INTO pizzas(name, ingredients) VALUES('Margarida', 0);
INSERT INTO pizzas(name, ingredients) VALUES('Hawaiana', 2);
INSERT INTO pizzas(name, ingredients) VALUES('Bacon Crispy', 3);
INSERT INTO pizzas(name, ingredients) VALUES('Americana', 3);
INSERT INTO pizzas(name, ingredients) VALUES('Traviata', 3);
INSERT INTO pizzas(name, ingredients) VALUES('Burguer', 4);
INSERT INTO pizzas(name, ingredients) VALUES('Castellera', 4);
INSERT INTO pizzas(name, ingredients) VALUES('Cowboy', 4);
INSERT INTO pizzas(name, ingredients) VALUES('Vaquera', 4);
INSERT INTO pizzas(name, ingredients) VALUES('Marinera', 4);
INSERT INTO pizzas(name, ingredients) VALUES('BBQ', 4);
INSERT INTO pizzas(name, ingredients) VALUES('Diablo', 4);
INSERT INTO pizzas(name, ingredients) VALUES('Carbonara', 4);
INSERT INTO pizzas(name, ingredients) VALUES('Serrana', 4);
INSERT INTO pizzas(name, ingredients) VALUES('4 Formatges', 4);
INSERT INTO pizzas(name, ingredients) VALUES('Pepperoni', 4);
INSERT INTO pizzas(name, ingredients) VALUES('Vegetal', 5);
INSERT INTO pizzas(name, ingredients) VALUES('Barcelona', 5);
INSERT INTO pizzas(name, ingredients) VALUES('Girona', 5);
INSERT INTO pizzas(name, ingredients) VALUES('Tarragona', 5);
INSERT INTO pizzas(name, ingredients) VALUES('Lleida', 5);
INSERT INTO pizzas(name, ingredients) VALUES('6 Formatges', 6);
INSERT INTO pizzas(name, ingredients) VALUES('Mallorquina', 6);
INSERT INTO pizzas(name, ingredients) VALUES('Carbonara Deluxe', 6);

SELECT * FROM pizzas;

## Taula d'ingredients
DROP TABLE IF EXISTS ingredients;

CREATE TABLE IF NOT EXISTS ingredients(
	id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL DEFAULT '' UNIQUE,
    PRIMARY KEY(id)
) ENGINE InnoDB;

INSERT INTO ingredients(name) VALUES('Pernil');
INSERT INTO ingredients(name) VALUES('Pinya');
INSERT INTO ingredients(name) VALUES('Pollastre');
INSERT INTO ingredients(name) VALUES('Bacon Crispy');
INSERT INTO ingredients(name) VALUES('Frankfurt');
INSERT INTO ingredients(name) VALUES('Bacon');
INSERT INTO ingredients(name) VALUES('Ou');
INSERT INTO ingredients(name) VALUES('Salsitxes');
INSERT INTO ingredients(name) VALUES('Ceba');
INSERT INTO ingredients(name) VALUES('Miniburguers');
INSERT INTO ingredients(name) VALUES('Tonyina');
INSERT INTO ingredients(name) VALUES('Xoriço');
INSERT INTO ingredients(name) VALUES('Olives');
INSERT INTO ingredients(name) VALUES('Salsa BBQ');
INSERT INTO ingredients(name) VALUES('Cheddar');
INSERT INTO ingredients(name) VALUES('Roquefort');
INSERT INTO ingredients(name) VALUES('Tomàquet Natural');
INSERT INTO ingredients(name) VALUES('Anxoves');
INSERT INTO ingredients(name) VALUES('Gambes');
INSERT INTO ingredients(name) VALUES('Carn');
INSERT INTO ingredients(name) VALUES('Salsa Carbonara');
INSERT INTO ingredients(name) VALUES('Xampinyons');
INSERT INTO ingredients(name) VALUES('Pernil Salat');
INSERT INTO ingredients(name) VALUES('Brie');
INSERT INTO ingredients(name) VALUES('Mozzarella');
INSERT INTO ingredients(name) VALUES('Emmental');
INSERT INTO ingredients(name) VALUES('Pepperoni');
INSERT INTO ingredients(name) VALUES('Pebrot');
INSERT INTO ingredients(name) VALUES('Escarxofa');
INSERT INTO ingredients(name) VALUES('Cabra');
INSERT INTO ingredients(name) VALUES('Sobrassada');
INSERT INTO ingredients(name) VALUES('Mel');

SELECT * FROM ingredients;

## Taula de relacions de pizzes amb ingredients
DROP TABLE IF EXISTS pizzasingredients;

CREATE TABLE IF NOT EXISTS pizzasingredients(
	id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    pizzaid INT(11) UNSIGNED NOT NULL,
    ingredientid INT(11) UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(pizzaid) REFERENCES pizzas(id),
    FOREIGN KEY(ingredientid) REFERENCES ingredients(id)
) ENGINE InnoDB;

INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Hawaiana'), (SELECT id FROM ingredients WHERE name LIKE 'Pernil'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Hawaiana'), (SELECT id FROM ingredients WHERE name LIKE 'Pinya'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Bacon Crispy'), (SELECT id FROM ingredients WHERE name LIKE 'Pernil'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Bacon Crispy'), (SELECT id FROM ingredients WHERE name LIKE 'Pollastre'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Bacon Crispy'), (SELECT id FROM ingredients WHERE name LIKE 'Bacon Crispy'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Americana'), (SELECT id FROM ingredients WHERE name LIKE 'Frankfurt'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Americana'), (SELECT id FROM ingredients WHERE name LIKE 'Bacon'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Americana'), (SELECT id FROM ingredients WHERE name LIKE 'Ou'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Traviata'), (SELECT id FROM ingredients WHERE name LIKE 'Bacon'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Traviata'), (SELECT id FROM ingredients WHERE name LIKE 'Salsitxes'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Traviata'), (SELECT id FROM ingredients WHERE name LIKE 'Ceba'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Burguer'), (SELECT id FROM ingredients WHERE name LIKE 'Miniburguers'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Burguer'), (SELECT id FROM ingredients WHERE name LIKE 'Ou'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Burguer'), (SELECT id FROM ingredients WHERE name LIKE 'Bacon'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Burguer'), (SELECT id FROM ingredients WHERE name LIKE 'Ceba'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Castellera'), (SELECT id FROM ingredients WHERE name LIKE 'Ceba'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Castellera'), (SELECT id FROM ingredients WHERE name LIKE 'Tonyina'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Castellera'), (SELECT id FROM ingredients WHERE name LIKE 'Xoriço'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Castellera'), (SELECT id FROM ingredients WHERE name LIKE 'Olives'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Cowboy'), (SELECT id FROM ingredients WHERE name LIKE 'Salsa BBQ'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Cowboy'), (SELECT id FROM ingredients WHERE name LIKE 'Cheddar'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Cowboy'), (SELECT id FROM ingredients WHERE name LIKE 'Roquefort'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Cowboy'), (SELECT id FROM ingredients WHERE name LIKE 'Bacon'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Vaquera'), (SELECT id FROM ingredients WHERE name LIKE 'Salsa BBQ'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Vaquera'), (SELECT id FROM ingredients WHERE name LIKE 'Ceba'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Vaquera'), (SELECT id FROM ingredients WHERE name LIKE 'Tomàquet Natural'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Vaquera'), (SELECT id FROM ingredients WHERE name LIKE 'Pollastre'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Marinera'), (SELECT id FROM ingredients WHERE name LIKE 'Tonyina'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Marinera'), (SELECT id FROM ingredients WHERE name LIKE 'Anxoves'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Marinera'), (SELECT id FROM ingredients WHERE name LIKE 'Gambes'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Marinera'), (SELECT id FROM ingredients WHERE name LIKE 'Pinya'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'BBQ'), (SELECT id FROM ingredients WHERE name LIKE 'Salsa BBQ'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'BBQ'), (SELECT id FROM ingredients WHERE name LIKE 'Carn'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'BBQ'), (SELECT id FROM ingredients WHERE name LIKE 'Bacon'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'BBQ'), (SELECT id FROM ingredients WHERE name LIKE 'Pollastre'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Diablo'), (SELECT id FROM ingredients WHERE name LIKE 'Pernil'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Diablo'), (SELECT id FROM ingredients WHERE name LIKE 'Carn'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Diablo'), (SELECT id FROM ingredients WHERE name LIKE 'Bacon'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Diablo'), (SELECT id FROM ingredients WHERE name LIKE 'Pollastre'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Carbonara'), (SELECT id FROM ingredients WHERE name LIKE 'Salsa Carbonara'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Carbonara'), (SELECT id FROM ingredients WHERE name LIKE 'Bacon'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Carbonara'), (SELECT id FROM ingredients WHERE name LIKE 'Ceba'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Carbonara'), (SELECT id FROM ingredients WHERE name LIKE 'Xampinyons'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Serrana'), (SELECT id FROM ingredients WHERE name LIKE 'Pernil Salat'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Serrana'), (SELECT id FROM ingredients WHERE name LIKE 'Brie'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Serrana'), (SELECT id FROM ingredients WHERE name LIKE 'Olives'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Serrana'), (SELECT id FROM ingredients WHERE name LIKE 'Xampinyons'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE '4 Formatges'), (SELECT id FROM ingredients WHERE name LIKE 'Mozzarella'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE '4 Formatges'), (SELECT id FROM ingredients WHERE name LIKE 'Emmental'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE '4 Formatges'), (SELECT id FROM ingredients WHERE name LIKE 'Roquefort'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE '4 Formatges'), (SELECT id FROM ingredients WHERE name LIKE 'Cheddar'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Pepperoni'), (SELECT id FROM ingredients WHERE name LIKE 'Pepperoni'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Pepperoni'), (SELECT id FROM ingredients WHERE name LIKE 'Pernil'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Pepperoni'), (SELECT id FROM ingredients WHERE name LIKE 'Carn'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Pepperoni'), (SELECT id FROM ingredients WHERE name LIKE 'Bacon'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Vegetal'), (SELECT id FROM ingredients WHERE name LIKE 'Ceba'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Vegetal'), (SELECT id FROM ingredients WHERE name LIKE 'Pebrot'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Vegetal'), (SELECT id FROM ingredients WHERE name LIKE 'Tomàquet Natural'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Vegetal'), (SELECT id FROM ingredients WHERE name LIKE 'Escarxofa'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Vegetal'), (SELECT id FROM ingredients WHERE name LIKE 'Xampinyons'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Barcelona'), (SELECT id FROM ingredients WHERE name LIKE 'Ceba'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Barcelona'), (SELECT id FROM ingredients WHERE name LIKE 'Carn'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Barcelona'), (SELECT id FROM ingredients WHERE name LIKE 'Brie'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Barcelona'), (SELECT id FROM ingredients WHERE name LIKE 'Pernil'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Barcelona'), (SELECT id FROM ingredients WHERE name LIKE 'Olives'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Girona'), (SELECT id FROM ingredients WHERE name LIKE 'Carn'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Girona'), (SELECT id FROM ingredients WHERE name LIKE 'Pernil'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Girona'), (SELECT id FROM ingredients WHERE name LIKE 'Xampinyons'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Girona'), (SELECT id FROM ingredients WHERE name LIKE 'Pollastre'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Girona'), (SELECT id FROM ingredients WHERE name LIKE 'Olives'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Tarragona'), (SELECT id FROM ingredients WHERE name LIKE 'Tonyina'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Tarragona'), (SELECT id FROM ingredients WHERE name LIKE 'Gambes'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Tarragona'), (SELECT id FROM ingredients WHERE name LIKE 'Ceba'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Tarragona'), (SELECT id FROM ingredients WHERE name LIKE 'Pernil'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Tarragona'), (SELECT id FROM ingredients WHERE name LIKE 'Olives'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Lleida'), (SELECT id FROM ingredients WHERE name LIKE 'Salsa BBQ'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Lleida'), (SELECT id FROM ingredients WHERE name LIKE 'Carn'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Lleida'), (SELECT id FROM ingredients WHERE name LIKE 'Pollastre'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Lleida'), (SELECT id FROM ingredients WHERE name LIKE 'Xampinyons'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Lleida'), (SELECT id FROM ingredients WHERE name LIKE 'Olives'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE '6 Formatges'), (SELECT id FROM ingredients WHERE name LIKE 'Mozzarella'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE '6 Formatges'), (SELECT id FROM ingredients WHERE name LIKE 'Cabra'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE '6 Formatges'), (SELECT id FROM ingredients WHERE name LIKE 'Brie'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE '6 Formatges'), (SELECT id FROM ingredients WHERE name LIKE 'Emmental'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE '6 Formatges'), (SELECT id FROM ingredients WHERE name LIKE 'Roquefort'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE '6 Formatges'), (SELECT id FROM ingredients WHERE name LIKE 'Cheddar'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Mallorquina'), (SELECT id FROM ingredients WHERE name LIKE 'Cabra'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Mallorquina'), (SELECT id FROM ingredients WHERE name LIKE 'Emmental'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Mallorquina'), (SELECT id FROM ingredients WHERE name LIKE 'Cheddar'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Mallorquina'), (SELECT id FROM ingredients WHERE name LIKE 'Brie'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Mallorquina'), (SELECT id FROM ingredients WHERE name LIKE 'Sobrassada'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Mallorquina'), (SELECT id FROM ingredients WHERE name LIKE 'Olives'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Carbonara Deluxe'), (SELECT id FROM ingredients WHERE name LIKE 'Salsa Carbonara'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Carbonara Deluxe'), (SELECT id FROM ingredients WHERE name LIKE 'Bacon'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Carbonara Deluxe'), (SELECT id FROM ingredients WHERE name LIKE 'Ceba'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Carbonara Deluxe'), (SELECT id FROM ingredients WHERE name LIKE 'Xampinyons'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Carbonara Deluxe'), (SELECT id FROM ingredients WHERE name LIKE 'Cabra'));
INSERT INTO pizzasingredients(pizzaid, ingredientid) VALUES((SELECT id FROM pizzas WHERE name LIKE 'Carbonara Deluxe'), (SELECT id FROM ingredients WHERE name LIKE 'Mel'));

SELECT * FROM pizzasingredients;

## Taula de relacions de delegacions amb pizzes
DROP TABLE IF EXISTS delegationspizzas;

CREATE TABLE IF NOT EXISTS delegationspizzas(
	id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    delegationid INT(11) UNSIGNED NOT NULL,
    pizzaid INT(11) UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(delegationid) REFERENCES delegations(id),
    FOREIGN KEY(pizzaid) REFERENCES pizzas(id)
) ENGINE InnoDB;

INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Margarida'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Hawaiana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Bacon Crispy'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Americana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Traviata'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Burguer'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Castellera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Cowboy'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Vaquera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Marinera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'BBQ'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Diablo'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Carbonara'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Serrana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE '4 Formatges'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Pepperoni'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Vegetal'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Barcelona'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE '6 Formatges'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Mallorquina'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Barcelona'), (SELECT id FROM pizzas WHERE name LIKE 'Carbonara Deluxe'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Margarida'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Hawaiana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Bacon Crispy'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Americana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Traviata'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Burguer'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Castellera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Cowboy'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Vaquera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Marinera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'BBQ'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Diablo'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Carbonara'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Serrana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE '4 Formatges'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Pepperoni'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Vegetal'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Girona'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE '6 Formatges'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Mallorquina'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Girona'), (SELECT id FROM pizzas WHERE name LIKE 'Carbonara Deluxe'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Margarida'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Hawaiana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Bacon Crispy'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Americana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Traviata'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Burguer'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Castellera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Cowboy'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Vaquera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Marinera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'BBQ'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Diablo'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Carbonara'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Serrana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE '4 Formatges'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Pepperoni'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Vegetal'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Tarragona'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE '6 Formatges'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Mallorquina'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Tarragona'), (SELECT id FROM pizzas WHERE name LIKE 'Carbonara Deluxe'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Margarida'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Hawaiana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Bacon Crispy'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Americana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Traviata'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Burguer'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Castellera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Cowboy'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Vaquera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Marinera'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'BBQ'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Diablo'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Carbonara'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Serrana'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE '4 Formatges'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Pepperoni'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Vegetal'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Lleida'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE '6 Formatges'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Mallorquina'));
INSERT INTO delegationspizzas(delegationid, pizzaid) VALUES((SELECT id FROM delegations WHERE name LIKE 'Lleida'), (SELECT id FROM pizzas WHERE name LIKE 'Carbonara Deluxe'));

SELECT * FROM delegationspizzas;

## Taula de begudes
DROP TABLE IF EXISTS drinks;

CREATE TABLE IF NOT EXISTS drinks(
	id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL DEFAULT '' UNIQUE,
    adultsonly INT NOT NULL DEFAULT 0,
    PRIMARY KEY(id)
) ENGINE InnoDB;

INSERT INTO drinks(name, adultsonly) VALUES('Aigua', 0);
INSERT INTO drinks(name, adultsonly) VALUES('Refresc', 0);
INSERT INTO drinks(name, adultsonly) VALUES('Cervesa', 1);

SELECT * FROM drinks;

## Taula de clients
DROP TABLE IF EXISTS clients;

CREATE TABLE IF NOT EXISTS clients(
	id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL DEFAULT '',
    phonenumber VARCHAR(30) NOT NULL DEFAULT '',
    address VARCHAR(255) NOT NULL DEFAULT '',
    previosclient INT NOT NULL DEFAULT 0,
    adult INT NOT NULL DEFAULT 0,
    PRIMARY KEY(id)
) ENGINE InnoDB;

SELECT * FROM clients;

## Taula de comandes
DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS orders(
	id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    clientid INT(11) UNSIGNED NOT NULL,
    delegationid INT(11) UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(clientid) REFERENCES clients(id),
    FOREIGN KEY(delegationid) REFERENCES delegations(id)
) ENGINE InnoDB;

SELECT * FROM orders;