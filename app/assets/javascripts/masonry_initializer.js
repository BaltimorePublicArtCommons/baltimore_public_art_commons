$(document).on('ready page:load', function() {
  initializeMasonry();
});

function initializeMasonry() {
  var container = document.querySelector('#items');

  imagesLoaded(container, function() {
    var masonry = new Masonry(container, {
      columnWidth: '.masonry-column-width',
      itemSelector: '.item'
    });
  });
}
