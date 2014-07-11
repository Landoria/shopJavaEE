package fr.commerce.dao;

import java.util.List;

import fr.commerce.beans.Commande;

public interface CommandeDao {
    void creer( Commande commande ) throws DAOException;

    Commande trouver( long id ) throws DAOException;

    void supprimer( Commande commande ) throws DAOException;

    List<Commande> lister() throws DAOException;
}
