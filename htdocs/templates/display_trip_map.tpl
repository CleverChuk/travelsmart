<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>TripMap</title>
<link rel=stylesheet href={CSS_FILE}>
<!-- BEGIN GOOGLE_MAPS_KEY -->
    <script src="{GOOGLE_MAPS_KEY}"
      type="text/javascript"></script>
<!-- END GOOGLE_MAPS_KEY -->
<script type="text/javascript">
//<![CDATA[
function load() {
	 if(GBrowserIsCompatible()) {
		var map = new GMap2(document.getElementById("map"));
		map.addControl(new {GMAP_CONTROL}());
		function createMarker(point,text) {
			 var marker = new GMarker(point);
			 GEvent.addListener(marker,"click",function() {
			 		marker.openInfoWindowHtml(text);
					
			 });
			 return marker;
		}
		var marker = new Array();
<!-- BEGIN SET_MARKERS -->
     	   	marker[{INDEX}] = new GLatLng({LAT},{LON});
<!-- END SET_MARKERS -->
     	 	var bounds = new GLatLngBounds;
		for (var i=0;i<marker.length;i++) {
		    bounds.extend(marker[i]);
		}
		var zoom_level=map.getBoundsZoomLevel(bounds);
<!-- BEGIN SET_LATLON -->
		map.setCenter(new GLatLng({LAT},{LON}),zoom_level);
<!-- END SET_LATLON -->
<!-- BEGIN SET_MARKER_TEXT -->
     	       map.addOverlay(createMarker(marker[{INDEX}],"{TEXT}"));
<!-- END SET_MARKER_TEXT -->
     	 }
}
//]]>
</script>
</head>
<body onload="load()" onunload="GUnload()">
{LOGOS}
<table>
<td width=50%></td><td>
<div id="map" style="width:700px; height: 500px"></div>
</td><td width=50%></td>
</table>
<center>
<a href="javascript:;" onclick=window.close()>Close Window</a>
</center>
{GOOGLE_ANALYTICS}
</body>
</html>