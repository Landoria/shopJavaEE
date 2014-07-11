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
	  <div class="col-md-10 col-md-offset-1">
	  	<table class="table table-bordered table-hover table-condensed">
			<tr>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Adresse</th>
				<th>Télephone</th>
				<th>Email</th>
				<th>Delete</th>
				<th>Photo</th>
			</tr>		
			<c:forEach items="${sessionScope.clients}" var="mapCli">
					<tr>
						<td><c:out value="${mapCli.value.nom}"/></td>
						<td><c:out value="${mapCli.value.prenom}"/></td>
						<td><c:out value="${mapCli.value.adresse}"/></td>
						<td><c:out value="${mapCli.value.telephone}"/></td>
						<td><c:out value="${mapCli.value.email}"/></td>
						<td class="danger">
							<a href="<c:url value="/suppressionClient">
							  <c:param name="idClient" value="${mapCli.value.id}"/>
								</c:url>">
								<button type="submit" class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-trash"></span>
								</button>
							</a>					
						</td>
						<td><a href="<c:url value="${mapCli.value.image }"/>"><img class="photo-thumbnail" src="<c:url value="${mapCli.value.image }"/>"/></a></td>
					</tr>
			</c:forEach>
		</table>
	  </div>
	</div>
</body>
</html>