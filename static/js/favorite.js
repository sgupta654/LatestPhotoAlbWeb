// Favorite.js
function Favorite(element, picid, favorite) {
  this.element = element;
  this.picid = picid;
  element.value = favorite; // objects in Javascript are assigned by reference, so this works
  element.addEventListener("change", this, false); 
}

Favorite.prototype.handleEvent = function(e) {
  if (e.type === "change") {
    this.update(this.element.value);
  }
}

Favorite.prototype.change = function(value) {
  this.data = value;
  this.element.value = value;
}

Favorite.prototype.update = function(favorite) {
  makeFavoritePostRequest(this.picid, favorite, function() {
    console.log('POST successful.');
  });
}

function makeFavoriteRequest(picid, cb) {
  qwest.get('/ilrj0i/pa3/pic/favorite?id=' + picid)
    .then(function(xhr, resp) {
      cb(resp);
    });
}

function makeFavoritePostRequest(picid, favorite, cb) {
  var data = {
    'id': picid,
    'favorite': favorite
  };

  qwest.post('/ilrj0i/pa3/pic/favorite', data, {
    dataType: 'json',
    responseType: 'json'
  }).then(function(xhr, resp) {
    cb(resp);
  });
}

function initFavorite(picid) {
  var favorite = document.getElementById("favorite");
  var favoriteBinding = new Favorite(favorite, picid);

  makeFavoriteRequest(picid, function(resp) {
    favoriteBinding.change(resp['favorite']);
  });

  setInterval(function() {
   makeFavoriteRequest(picid, function(resp) {
      favoriteBinding.change(resp['favorite']);
    }); 
  }, 7000);
}