// Favorite.js
function Favorite(element, picid, favorite) { //favorite = username favorited
  this.element = element;
  this.picid = picid;
  element.value = favorite; // objects in Javascript are assigned by reference, so this works
  element.addEventListener("change", this, false); //post request on enter?
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
  qwest.get('/ilrj0i/pa3/pic/favorites?id=' + picid)
    .then(function(xhr, resp) {
      cb(resp);
    });
}

function makeFavoritePostRequest(picid, favorite, cb) {
  var data = {
    'id': picid,
    'username': favorite
  };

  qwest.post('/ilrj0i/pa3/pic/favorites', data, {
    dataType: 'json',
    responseType: 'json'
  }).then(function(xhr, resp) {
    cb(resp);
  });
}

function initFavorite(picid, username) {
  console.log(username);
  var favorite = document.getElementById("numfavorites");
  var favoriteBinding = new Favorite(favorite, picid);
  var secondfavorite = document.getElementById("latestfavorite");
  var secondfavoriteBinding = new Favorite(secondfavorite, picid);

  makeFavoriteRequest(picid, function(resp) {
    //console.log(resp['data']);
    favoriteBinding.change(resp['data']['num_favorites']);
    secondfavoriteBinding.change(resp['data']['latest_favorite']);
  });

  setInterval(function() {
    makeFavoriteRequest(picid, function(resp) {
      console.log(resp['data']);
      favoriteBinding.change(resp['data']['num_favorites']);
      secondfavoriteBinding.change(resp['data']['latest_favorite']);
    });
  }, 100);
}
