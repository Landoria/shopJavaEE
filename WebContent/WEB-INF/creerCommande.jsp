<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Affichage d'une commande</title>
    </head>
    <body>
    	<div class="row">		  
    		<form  method="post" action="creationCommande" >
				<fieldset>	
					<div class="row">	
						<div class="col-md-2 col-md-offset-1">
							<label for="idClient">Client <span class="requis">*</span></label>
							<select name="idClient" size="1">
								<c:forEach items="${sessionScope.clients }" var="mapCli">
									<option><c:out value="${mapCli.value.id } " /></option> 
								</c:forEach>
							</select>
							<br/><span class="erreur">${requestScope.form.erreurs['nomClient'] }</span>
						</div>
						<div class="col-md-2">
							<span class="smaller info"><a href="<c:url value="/creationClient"/>">  Nouveau Client ?</a></span>
						</div>
					</div>
			
				<br/>
				<div class="row">	
					<div class="col-md-4 col-md-offset-1">
						<div class="form-group">
						<label for="dateCommande">Date </label>
						<input disabled type="text" class="form-control" id="dateCommande" name="dateCommande">
						</div>
									
						<div class="form-group">
						<label for="montantCommande">Montant <span class="requis">*</span></label>
						<input type="text" class="form-control" id="montantCommande" name="montantCommande" value="<c:out value='${requestScope.commande.montant }'/>">
						<span class="erreur">${requestScope.form.erreurs['montantCommande'] }</span>
						</div>
											  					  	
						<div class="form-group">
						<label for="modePaiementCommande">Mode de paiement <span class="requis">*</span></label>
						<input type="text" class="form-control" id="modePaiementCommande" name="modePaiementCommande" value="<c:out value='${requestScope.commande.modePaiement }'/>">
						<span class="erreur">${requestScope.form.erreurs['modePaiementCommande'] }</span>
						</div>
					</div>
					<div class="col-md-4 col-md-offset-1">	
						<div class="form-group">
						<label for="statutPaiementCommande">Statut du paiement</label>
						<input type="text" class="form-control" id="statutPaiementCommande" name="statutPaiementCommande" value="<c:out value='${requestScope.commande.statutPaiement }'/>">
						<span class="erreur">${requestScope.form.erreurs['statutPaiementCommande'] }</span>
						</div>
						
						<div class="form-group">
						<label for="modeLivraisonCommande">Mode de livraison <span class="requis">*</span></label>
						<input type="text" class="form-control" id="modeLivraisonCommande" name="modeLivraisonCommande" value="<c:out value='${requestScope.commande.modeLivraison }'/>">
						<span class="erreur">${requestScope.form.erreurs['modeLivraisonCommande'] }</span>
						</div>
						
						<div class="form-group">
						<label for="statutLivraisonCommande">Statut de la livraison</label>
						<input type="text" class="form-control" id="statutLivraisonCommande" name="statutLivraisonCommande" value="<c:out value='${requestScope.commande.statutLivraison }'/>">
						<span class="erreur">${requestScope.form.erreurs['statutLivraisonCommande'] }</span>
						</div>
					</div>
				</div>
				</fieldset>	
				
				<div class="row">		  
    				<div class="col-md-4 col-md-offset-1">
		    			<button type="submit" class="btn btn-default">Valider</button>
						<button type="reset" class="btn btn-default" >Reset</button> 
    				</div>
				</div>
			</form>
		</div>
		<div class="row">		  
    		<div class="col-md-4 col-md-offset-1">
    			<p class="info"><em>${ requestScope.form.resultat }</em></p>
    		</div>
		</div>    	
    </body>
</html>