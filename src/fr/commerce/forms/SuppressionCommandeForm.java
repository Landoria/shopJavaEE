package fr.commerce.forms;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import fr.commerce.beans.Commande;
import fr.commerce.dao.CommandeDao;

public class SuppressionCommandeForm {
    private static final String CHAMP_COMMANDE_A_SUPPRIMER = "dateCommande";
    private CommandeDao         commandeDao;

    public SuppressionCommandeForm( CommandeDao commandeDao ) {
        this.commandeDao = commandeDao;
    }

    public Commande supprimerCommande( HttpServletRequest request ) {
        // get the parameter for commande
        String dt = getValeurChamp( request, CHAMP_COMMANDE_A_SUPPRIMER );
        DateTimeFormatter formatter = DateTimeFormat.forPattern( "dd/MM/yyyy HH:mm:ss" );
        DateTime dateCommande = formatter.parseDateTime( dt );

        // set date to commande
        Commande commande = new Commande();
        commande.setDate( dateCommande );

        // return commande with parameter for control
        return commande;
    }

    private static String getValeurChamp( HttpServletRequest req, String champ ) {
        String value = req.getParameter( champ );
        if ( champ == null || champ.trim().length() == 0 ) {
            return null;
        }
        return value;
    }
}