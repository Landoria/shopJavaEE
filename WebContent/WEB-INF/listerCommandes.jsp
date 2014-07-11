<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="row">
			<div class="col-md-11">
	    		<table class="table table-bordered table-hover table-condensed" >
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
		    			<th>Delete</th>
		    		</tr>
		    	<c:forEach items="${sessionScope.commandes}" var="mapCom">
		    		<tr>
		    			<td><c:out value="${ mapCom.value.client.nom }"/></td>
		    			<td><c:out value="${ mapCom.value.client.prenom }"/></td>
		    			<td><c:out value="${ mapCom.value.client.adresse }"/></td>
		    			<td><c:out value="${ mapCom.value.client.telephone }"/></td>
		    			<td><c:out value="${ mapCom.value.client.email }"/></td>
		    			<td><a href="<c:url value="${mapCom.value.client.image }"/>"><img class="photo-thumbnail" src="<c:url value="${mapCom.value.client.image }"/>"/></a></td>
		    			<td><joda:format value="${ mapCom.value.date }" pattern="dd/MM/yyyy HH:mm:ss"/></td>
		    			<td><c:out value="${ mapCom.value.montant}"/></td>
		    			<td><c:out value="${ mapCom.value.modePaiement}"/></td>
		    			<td><c:out value="${ mapCom.value.statutPaiement}"/></td>
		    			<td><c:out value="${ mapCom.value.modeLivraison}"/></td>
		    			<td><c:out value="${ mapCom.value.statutLivraison}"/></td>
		    			<td class="danger">
							<a href="<c:url value="/suppressionCommande">
							  <c:param name="idCommande" value="${mapCom.value.id}"/>
								</c:url>">
								<button type="submit" class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-trash"></span>
								</button>
							</a>					
						</td>
		    		</tr>
		    	</c:forEach>	    		
	    		</table>		            	  
			</div>
		</div>    	
</body>
</html>