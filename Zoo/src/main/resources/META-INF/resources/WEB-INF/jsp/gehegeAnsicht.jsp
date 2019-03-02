<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html> 
  <head> 
    <title>Willkommen im Zoo</title> 
  </head> 
  <body> 
    <h1>Sie sind hier: ${gehege.compoundName}</h1> 
    <h2>Sie sehen diese Tiere:</h2> 
    
    <form method="POST" action="<c:url value='/tierWahl'/>">
    <c:forEach var="tier" items="${alleTiere}">
    	<c:if test="${!tier.hidden}">
    		<input     type="radio" 
					   name="tierName" 
					   value="${tier.animalName}" 
		 	/> ${tier.animalName}
		</c:if>
	</c:forEach>
	 <input type="hidden" name="gehegeName" value="${gehege.compoundName}" />
	 <input type="submit" value="Gehe zum Tier" name="tierWahl"/>
   	</form>
    <h2>Diese Tiere verstecken sich:</h2> 
    	<ul>
      	 	 <c:forEach var="tier" items="${alleTiere}">
    			<c:if test="${tier.hidden}">
					<li>${tier.animalName}</li>
				</c:if>
			 </c:forEach>
		</ul>
    
	<form method="POST" action="<c:url value='/'/>">
    	<input type="submit" value="Zurueck zur Karte" name="startseite">
   	</form>
	 	 <c:if test="${keineAuswahl}">
	 	 	<p>Achtung - Bitte ein Tier auswaehlen!</p>
	 	 	<img src="images/parrot.jpg"/>
	 	 </c:if>

  </body> 
</html> 