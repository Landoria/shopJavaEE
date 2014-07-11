<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Affichage d'une commande</title>
    </head>
    <body>
    
	    <div class="row">
			 <div class="col-md-11 col-md-offset-1">
				<p class="info">${ requestScope.form.resultat }</p>   			            	  
			  </div>
		</div>
	    	
	    <div class="row">
			<div class="col-md-11">
	    		<table class="table">
		    		<tr>
		    			<th>Nom</th>
		    			<th>Prénom</th>
		    			<th>Adresse</th>
		    			<th>Téléphone</th>
		    			<th>Email</th>
		    			<th>Photo</th>
		    			<th>Date</th>
		    			<th>Montant</th>
		    			<th>Mode de paiement</th>
		    			<th>Statut du paiement</th>
		    			<th>Mode de livraison</th>
		    			<th>Statut de la livraison</th>
		    		</tr>
		    		<tr>
		    			<td><c:out value="${ commande.client.nom }"/></td>
		    			<td><c:out value="${ commande.client.prenom }"/></td>
		    			<td><c:out value="${ commande.client.adresse }"/></td>
		    			<td><c:out value="${ commande.client.telephone }"/></td>
		    			<td><c:out value="${ commande.client.email }"/></td>
		    			<td><a href="<c:url value="${commande.client.image }"/>"><img class="photo-thumbnail" src="<c:url value="${commande.client.image }"/>"/></a></td>
		    			<td><joda:format value="${ requestScope.commande.date }" pattern="dd/MM/yyyy HH:mm:ss"/></td>
		    			<td><c:out value="${ requestScope.commande.montant}"/></td>
		    			<td><c:out value="${ requestScope.commande.modePaiement}"/></td>
		    			<td><c:out value="${ requestScope.commande.statutPaiement}"/></td>
		    			<td><c:out value="${ requestScope.commande.modeLivraison}"/></td>
		    			<td><c:out value="${ requestScope.commande.statutLivraison}"/></td>
		    		</tr>
	    		</table>		            	  
			</div>
		</div>    		
    </body>
</html>