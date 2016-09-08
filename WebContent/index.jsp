<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"/>

    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.21.0/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.21.0/mapbox-gl.css' rel='stylesheet' /> 
	<script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v1.3.0/mapbox-gl-geocoder.js'></script>
	<link rel='stylesheet' href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v1.3.0/mapbox-gl-geocoder.css' type='text/css' />
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.0-rc.2/dist/leaflet.css" />
	<script src="https://unpkg.com/leaflet@1.0.0-rc.2/dist/leaflet.js"></script>
	
	<div id='map'></div>
	<div id='geocoder-container'></div>
	
	<div class='map-overlay' id='features'><h2>Data and Analytics</h2><div id='pd'></div></div>
	
	<script>
		mapboxgl.accessToken = 'pk.eyJ1IjoiZ2Vsb2tvIiwiYSI6ImNpcXRodjFtbzAwNHBnMm5oMG44ODNkNG8ifQ.S-yhFFEeGzplgbc_EXPkvg';
		
		var map = new mapboxgl.Map({
		    container: 'map', // container id
		    style: 'mapbox://styles/geloko/ciqthvpn0000fc8mbycfye3fi'
		   
		});
		
		var geocoder = new mapboxgl.Geocoder({
		    container: 'geocoder-container' // Optional. Specify a unique container for the control to be added to.
		});
	
		map.addControl(geocoder);
		
		map.on('load', function() {
			  // the rest of the code will go in here
		      document.getElementById('features').style.display = "none";
			  
			});
		
		map.on('click', function (e) {
			  var data = map.queryRenderedFeatures(e.point);
			  
			  if (data.length > 0) 
			  {
				  if(data[0].layer.id == "Metro Manila Barangays")
				  {
					  document.getElementById('features').style.display = "block";
				      document.getElementById('pd').innerHTML = "<h3><strong>Brgy. " + data[0].properties.name + "</strong></h3><br>";	
				  }
				  else if(data[0].layer.id == "> Magnitude 7 Earthquakes" || data[0].layer.id == "Between 3.5 and 7 magnitude Earthquakes" || data[0].layer.id == "< Magnitude 3.5 Earthquakes")
				  {
					  document.getElementById('features').style.display = "block";
			      	  document.getElementById('pd').innerHTML = "<h3><strong>" + data[0].properties.magnitude + " Magnitude Earthquake </br><br></strong></h3><h4>" + data[0].properties.title + "<br><br>" + data[0].properties.date + "<h4>";	
				 
				  }
				  else
				  {
				  	  //document.getElementById('features').style.display = "block";
			      	  //document.getElementById('pd').innerHTML = JSON.stringify(data, null, 2);
				      document.getElementById('features').style.display = "none";	
				  }
				  
			  } else 
			  {
			      document.getElementById('features').style.display = "none";
			  }
			});
		
		//switch layers
		var layerList = document.getElementById('icons');
		var inputs = layerList.getElementsByTagName('div');
		
		function switchLayer(layer) {
		    var layerId = layer.target.id;
		    
		    if(layerId == 'flood')
	    	{
				map.setStyle('mapbox://styles/geloko/cird4c5ql000hgfm4jyzfejab');
	    	}
		    if(layerId == 'storm')
	    	{
		    	map.setStyle('mapbox://styles/geloko/cird4bj9a000hgcnkuqrujccn');
		    	//map.setStyle('mapbox://styles/mapbox/satellite-v9');
			}
		    if(layerId == 'earthquake')
		    {
		    	map.setStyle('mapbox://styles/geloko/ciqthvpn0000fc8mbycfye3fi');
			}
		}
		
		for (var i = 0; i < inputs.length; i++) {
		    inputs[i].onclick = switchLayer;
		}
	</script>
</div>

</body>
</html>