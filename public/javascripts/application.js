// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery.noConflict();

jQuery(document).ready(function(){
  jQuery('.map-canvas').each(function(){
    var myLatlng = new google.maps.LatLng(42.467629,-70.926159);
    var myOptions = {
      zoom: 14,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(this, myOptions);
    jQuery.ajax({
      type: 'GET',
      url: '/fixes/fixes_list',
      success: function(json){
        jQuery(json.fixes).each(function(){
          var latLng = new google.maps.LatLng(this.fix.latitude,this.fix.longitude);
          var marker = new google.maps.Marker({position:latLng ,map: map}); 
        });
      },
      error: function(xhr){
      }
    });
  });

});
