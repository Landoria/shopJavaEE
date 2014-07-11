<%@ page pageEncoding="UTF-8" %>
<div class="row">	
	<div class="col-md-4 col-md-offset-1">
		<div class="form-group">
		<label for="nomClient">Nom : <span class="requis">*</span></label>
		<input type="text" class="form-control" id="nomClient" placeholder="Enter name" name="nomClient" value="<c:out value="${client.nom}"/>">
		<span class="erreur">${requestScope.form.erreurs['nomClient'] }</span>
		</div>
					
		<div class="form-group">
		<label for="prenomClient">Prenom : </label>
		<input type="text" class="form-control" id="prenomClient" placeholder="Enter first name" name="prenomClient" value="<c:out value="${client.prenom }"/>">
		<span class="erreur">${requestScope.form.erreurs['prenomClient'] }</span>
		</div>
							  					  	
		<div class="form-group">
		<label for="adresseClient">Adresse : <span class="requis">*</span></label>
		<input type="text" class="form-control" id="adresseClient" placeholder="Enter adress" name="adresseClient" value="<c:out value="${client.adresse}"/>">
		<span class="erreur">${requestScope.form.erreurs['adresseClient'] }</span>
		</div>
	</div>
	
	<div class="col-md-4 col-md-offset-1">
		<div class="form-group">
		<label for="telephoneClient">Téléphone : <span class="requis">*</span></label>
		<input type="text" class="form-control" id="telephoneClient" placeholder="Enter phone n° " name="telephoneClient" value="<c:out value="${client.telephone}"/>">
		<span class="erreur">${requestScope.form.erreurs['telephoneClient'] }</span>
		</div>
									  	
		<div class="form-group">
		<label for="emailClient">Email : </label>
		<input type="text" class="form-control" id="emailClient" placeholder="Enter email" name="emailClient" value="<c:out value="${client.email}"/>">
		<span class="erreur">${requestScope.form.erreurs['emailClient'] }</span>
		</div>
		
		
	</div>
</div>	
	
						  	
						  	
	
			
			
			
 			