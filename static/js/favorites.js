// Favorite.js
function Favorite(element, picid, username) { //favorite = username favorited
  console.log("Favorite:" + username);
  this.element = element;
  this.picid = picid;
  this.username = username;
  //element.username = username; // objects in Javascript are assigned by reference, so this works
  console.log("Favorite:" + this.username);
  var favorite_button = document.getElementById("favorite_button");
  favorite_button.addEventListener("click", this, false); //post request on enter?
}

Favorite.prototype.handleEvent = function(e) {
  if (e.type === "click") {
    console.log("HandleEvent:" + this.username);
    this.update(this.username);
  }
}

Favorite.prototype.change = function(value) {
  this.data = value;
  this.element.value = value;
}

Favorite.prototype.update = function(username) {
  console.log("UPDATE: " + username);
  makeFavoritePostRequest(this.picid, username, function() {
    console.log('POST successful.');
  });
}

function makeFavoriteRequest(picid, cb) {
  qwest.get('/ilrj0i/pa3/pic/favorites?id=' + picid)
    .then(function(xhr, resp) {
      cb(resp);
    });
}

function makeFavoritePostRequest(picid, username, cb) {
  var data = {
    'id': picid,
    'username': username
  };

  qwest.post('/ilrj0i/pa3/pic/favorites', data, {
    dataType: 'json',
    responseType: 'json'
  }).then(function(xhr, resp) {
    cb(resp);
  });
}

function initFavorite(picid, username) {
  //console.log(username);
  var favorite = document.getElementById("numfavorites");
  var favoriteBinding = new Favorite(favorite, picid, username);
  var secondfavorite = document.getElementById("latestfavorite");
  var secondfavoriteBinding = new Favorite(secondfavorite, picid, username);
  //console.log(username);
  makeFavoriteRequest(picid, function(resp) {
    //console.log(resp['data']);
    favoriteBinding.change(resp['data']['num_favorites']);
    secondfavoriteBinding.change(resp['data']['latest_favorite']);
  });

  setInterval(function() {
   makeFavoriteRequest(picid, function(resp) {
      //console.log(resp['data']);
      favoriteBinding.change(resp['data']['num_favorites']);
      secondfavoriteBinding.change(resp['data']['latest_favorite']);
    });
  }, 100);
}
