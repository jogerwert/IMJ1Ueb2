<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html> 
  <head> 
    <title>Willkommen im Zoo</title> 
  </head> 
  <body> 
    <h1>Sie beobachten ${tier.animalName} und ${tier.animalName} beobachtet zurueck</h1> 
    <img src="images/${tier.image}.jpg"/>

 	<c:choose>
 		<c:when test="${tier.hunger > 0}">
 			<h2>Hunger: ${tier.hunger}</h2> 
 			<form method="POST" action="<c:url value='/fuettern'/>">
				<input type="hidden" name="tierName" value="${tier.animalName}" />
				<input type="hidden" name="gehegeName" value="${gehege.compoundName}" />
    			<input type="submit" value="Fuettern" name="tierWahl"/>
   			</form>	
  		</c:when>
    	<c:otherwise>
    	<p>Das Tier ${tier.animalName} hat keinen Hunger.</p>
   		</c:otherwise>
    </c:choose>
    
	<form method="POST" action="<c:url value='/gehegeWahl'/>">
		<input type="hidden" name="gehegeName" value="${gehege.compoundName}" />
    	<input type="submit" value="Zurueck zum Gehege" name="gehegeWahl"/>
   	</form>


  </body> 
</html> 