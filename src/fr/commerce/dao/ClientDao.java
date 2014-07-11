package fr.commerce.dao;

import java.util.List;

import fr.commerce.beans.Client;

public interface ClientDao {
    void creer( Client client ) throws DAOException;

    Client trouver( long id ) throws DAOException;

    void supprimer( Client client ) throws DAOException;

    List<Client> lister() throws DAOException;
}
