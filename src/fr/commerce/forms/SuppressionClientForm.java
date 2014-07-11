package fr.commerce.forms;

import javax.servlet.http.HttpServletRequest;

import fr.commerce.beans.Client;
import fr.commerce.dao.ClientDao;

public class SuppressionClientForm {
    private static final String CHAMP_CLIENT_A_SUPPRIMER = "nomClient";
    private ClientDao           clientDao;

    public SuppressionClientForm( ClientDao clientDao ) {
        this.clientDao = clientDao;
    }

    public Client supprimerClient( HttpServletRequest request ) {
        // get the parameter for client
        String nomClient = getValeurChamp( request, CHAMP_CLIENT_A_SUPPRIMER );

        // set name to client
        Client client = new Client();
        client.setNom( nomClient );

        // return client with parameter for control
        return client;
    }

    private static String getValeurChamp( HttpServletRequest req, String champ ) {
        String value = req.getParameter( champ );
        if ( champ == null || champ.trim().length() == 0 ) {
            return null;
        }
        return value;
    }
}