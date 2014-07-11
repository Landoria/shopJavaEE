<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>		
        <meta charset="utf-8" />
        <title>Affichage d'un client</title>
    </head>
    <body>
   		 <div class="row">
		  <div class="col-md-11 col-md-offset-1"">
			<p class="info">${ form.resultat }</p>   			            	  
		  </div>
		</div>
    	
    	<div class="row">
		  <div class="col-md-10 col-md-offset-2">
    		<table class="table">
	    		<tr>
	    			<th>Nom</th>
	    			<th>Prénom</th>
	    			<th>Adresse</th>
	    			<th>Téléphone</th>
	    			<th>Email</th>
	    			<th>Photo</th>
	    		</tr>
	    		<tr>
	    			<td><c:out value="${ client.nom }"/></td>
	    			<td><c:out value="${ client.prenom }"/></td>
	    			<td><c:out value="${ client.adresse }"/></td>
	    			<td><c:out value="${ client.telephone }"/></td>
	    			<td><c:out value="${ client.email }"/></td>
	    			<td><a href="<c:url value="${client.image }"/>"><img class="photo-thumbnail" src="<c:url value="${client.image }"/>"/></a></td>
	    			
	    		</tr>
    		</table>		            	  
		  </div>
		</div>
	 
	 </body>
</html>