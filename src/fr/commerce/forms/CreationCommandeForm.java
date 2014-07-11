package fr.commerce.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;

import fr.commerce.beans.Client;
import fr.commerce.beans.Commande;
import fr.commerce.dao.ClientDao;
import fr.commerce.dao.CommandeDao;
import fr.commerce.dao.DAOException;

public class CreationCommandeForm {

    private static final String CHAMP_ID_CLIENT        = "idClient";
    private static final String CHAMP_MONTANT          = "montantCommande";
    private static final String CHAMP_MODE_PAIEMENT    = "modePaiementCommande";
    private static final String CHAMP_STATUT_PAIEMENT  = "statutPaiementCommande";
    private static final String CHAMP_MODE_LIVRAISON   = "modeLivraisonCommande";
    private static final String CHAMP_STATUT_LIVRAISON = "statutLivraisonCommande";

    private String              resultat;
    private Map<String, String> erreurs                = new HashMap<String, String>();
    private ClientDao           clientDao;
    private CommandeDao         commandeDao;

    public CreationCommandeForm( CommandeDao commandeDao, ClientDao clientDao ) {
        this.clientDao = clientDao;
        this.commandeDao = commandeDao;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public Commande creerCommande( HttpServletRequest request ) {

        /* Récupération de la date dans un DateTime Joda. */
        DateTime dt = new DateTime();

        String montant = getValeurChamp( request, CHAMP_MONTANT );
        String modePaiement = getValeurChamp( request, CHAMP_MODE_PAIEMENT );
        String statutPaiement = getValeurChamp( request, CHAMP_STATUT_PAIEMENT );
        String modeLivraison = getValeurChamp( request, CHAMP_MODE_LIVRAISON );
        String statutLivraison = getValeurChamp( request, CHAMP_STATUT_LIVRAISON );

        Commande commande = new Commande();
        commande.setDate( dt );

        Client client = new Client();
        String idCli = getValeurChamp( request, CHAMP_ID_CLIENT );
        Long idClient = Long.parseLong( idCli );
        client.setId( idClient );
        traiterClient( client, commande );

        traiterMontant( montant, commande );
        traiterModePaiement( modePaiement, commande );
        traiterStatutPaiement( statutPaiement, commande );
        traiterModeLivraison( modeLivraison, commande );
        traiterStatutLivraison( statutLivraison, commande );
        try {
            if ( erreurs.isEmpty() ) {
                commandeDao.creer( commande );
                resultat = "Succès de la création de la commande.";
            } else {
                resultat = "Échec de la création de la commande.";
            }
        } catch ( DAOException e ) {
            setErreur( "imprévu", "Erreur imprévue lors de la création." );
            resultat = "Échec de la création de la commande : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
            e.printStackTrace();
        }

        return commande;
    }

    private void traiterClient( Client client, Commande commande ) {
        Client cli = new Client();
        if ( client == null ) {
            setErreur( CHAMP_ID_CLIENT, "Client inconnu, merci d'utiliser le formulaire prévu à cet effet." );
        }
        else {
            try {
                cli = clientDao.trouver( client.getId() );
                if ( cli.equals( null ) ) {
                    resultat = "client introuvable";
                }
            } catch ( DAOException e ) {
                setErreur( "imprévu", "Erreur imprévue lors de la recherche du client." );
                resultat = "Échec de la création de la commande : une erreur imprévue est survenue, merci de réessayer dans quelques instants.";
                e.printStackTrace();
            }
            client.setNom( cli.getNom() );
            client.setPrenom( cli.getPrenom() );
            client.setAdresse( cli.getAdresse() );
            client.setTelephone( cli.getTelephone() );
            client.setEmail( cli.getEmail() );
            client.setImage( cli.getImage() );
            commande.setClient( client );
        }
    }

    private void traiterMontant( String montant, Commande commande ) {
        double valeurMontant = -1;
        try {
            valeurMontant = validationMontant( montant );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_MONTANT, e.getMessage() );
        }
        commande.setMontant( valeurMontant );
    }

    private void traiterModePaiement( String modePaiement, Commande commande ) {
        try {
            validationModePaiement( modePaiement );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_MODE_PAIEMENT, e.getMessage() );
        }
        commande.setModePaiement( modePaiement );
    }

    private void traiterStatutPaiement( String statutPaiement, Commande commande ) {
        try {
            validationStatutPaiement( statutPaiement );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_STATUT_PAIEMENT, e.getMessage() );
        }
        commande.setStatutPaiement( statutPaiement );
    }

    private void traiterModeLivraison( String modeLivraison, Commande commande ) {
        try {
            validationModeLivraison( modeLivraison );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_MODE_LIVRAISON, e.getMessage() );
        }
        commande.setModeLivraison( modeLivraison );
    }

    private void traiterStatutLivraison( String statutLivraison, Commande commande ) {
        try {
            validationStatutLivraison( statutLivraison );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_STATUT_LIVRAISON, e.getMessage() );
        }
        commande.setStatutLivraison( statutLivraison );
    }

    private double validationMontant( String montant ) throws FormValidationException {
        double temp;
        if ( montant != null ) {
            try {
                temp = Double.parseDouble( montant );
                if ( temp < 0 ) {
                    throw new FormValidationException( "Le montant doit être un nombre positif." );
                }
            } catch ( NumberFormatException e ) {
                temp = -1;
                throw new FormValidationException( "Le montant doit être un nombre." );
            }
        } else {
            temp = -1;
            throw new FormValidationException( "Merci d'entrer un montant." );
        }
        return temp;
    }

    private void validationModePaiement( String modePaiement ) throws FormValidationException {
        if ( modePaiement != null ) {
            if ( modePaiement.length() < 2 ) {
                throw new FormValidationException( "Le mode de paiement doit contenir au moins 2 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer un mode de paiement." );
        }
    }

    private void validationStatutPaiement( String statutPaiement ) throws FormValidationException {
        if ( statutPaiement != null && statutPaiement.length() < 2 ) {
            throw new FormValidationException( "Le statut de paiement doit contenir au moins 2 caractères." );
        }
    }

    private void validationModeLivraison( String modeLivraison ) throws FormValidationException {
        if ( modeLivraison != null ) {
            if ( modeLivraison.length() < 2 ) {
                throw new FormValidationException( "Le mode de livraison doit contenir au moins 2 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer un mode de livraison." );
        }
    }

    private void validationStatutLivraison( String statutLivraison ) throws FormValidationException {
        if ( statutLivraison != null && statutLivraison.length() < 2 ) {
            throw new FormValidationException( "Le statut de livraison doit contenir au moins 2 caractères." );
        }
    }

    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
}
