document.addEventListener("turbo:load", function() {
    if ( window.google && window.google.maps ) {
    initMap();

  const inputLocation = document.getElementById('location');

  const options = {
    types: ['establishment'],
    componentRestrictions: { country: 'JP' },
  };

  const autocompleteLocation = new google.maps.places.Autocomplete(inputLocation, options);

  autocompleteLocation.addListener('place_changed', function() {
    const place = autocompleteLocation.getPlace();
    inputLocation.value = place.formatted_address;
  })};
});
