<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>		
        <meta charset="utf-8" />
        <title>Affichage d'un client</title>
    </head>
    <body> 
    	<div class="row">		  
    		<form  method="post" action="creationClient" enctype="multipart/form-data">
				<fieldset>			
						<c:import url="/inc/inc_infoCli.jsp"/>	
				<div class="row">	
					<div class="col-md-9 col-md-offset-1">	
						<div class="form-group">
							<label for="imageClient">Photo : </label>
							<input type="file" class="form-control" id="imageClient" name="imageClient" />
							<span class="erreur"><c:out value="${form.erreurs.imageClient }"/></span>
						</div>
					</div>
				</div>
			  
				</fieldset>	
				<div class="row">		  
    				<div class="col-md-4 col-md-offset-1">
		    			<button type="submit" class="btn btn-default">Valider</button>
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