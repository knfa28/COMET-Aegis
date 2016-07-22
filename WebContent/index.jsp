<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"/>
	
	<div id='map'></div>
	
	<script>
		mapboxgl.accessToken = 'pk.eyJ1IjoiZ2Vsb2tvIiwiYSI6ImNpcXRodjFtbzAwNHBnMm5oMG44ODNkNG8ifQ.S-yhFFEeGzplgbc_EXPkvg';
		
		var map = new mapboxgl.Map({
		    container: 'map', // container id
		    style: 'mapbox://styles/geloko/ciqthvpn0000fc8mbycfye3fi'
		   
		});
	</script>

</div>

</body>
</html>