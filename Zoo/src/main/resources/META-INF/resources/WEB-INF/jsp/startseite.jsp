<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html> 
  <head> 
    <title>Willkommen im Zoo</title> 
  </head> 
  <body> 
    <h1>Willkommen im Zoo</h1> 
    <h2>Welches Gehege moechten Sie besuchen?</h2> 
    <h3>Schauen Sie auf unsere Karte</h3> 
  
    <form method="POST" action="<c:url value='/gehegeWahl'/>"
	<c:forEach items="${alleGehege}" var="gehege">
	  	<p></p>
			<input type="radio" 
				   name="gehegeName" 
				   value="${gehege.compoundName}" 
		     />${gehege.compoundName}
		     
	</c:forEach>
		 <p><input type="submit"
	 		value="Gehe zum Gehege."
	 		name="geheZuGehege"
	 		/></p>
	 	 <c:if test="${keineAuswahl}">
	 	 	<p>Achtung - Bitte ein Gehege auswaehlen!</p>
	 	 	<img src="images/parrot.jpg"/>
	 	 </c:if>
	 		
	</form>


  </body> 
</html> 