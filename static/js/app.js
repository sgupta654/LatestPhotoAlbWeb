// /static/js/app/app.js
window.App = Ember.Application.create();

Ember.Application.initializer({
  name: 'usernameValidator',
  after: 'store',
  initialize: function (app) {
    // Inject the Ember Data Store into our validator service
    app.inject('service:username-validator', 'store', 'store:main');

    // Inject the validator into all controllers and routes
    app.inject('controller', 'usernameValidator', 'service:username-validator');
    app.inject('route', 'usernameValidator', 'service:username-validator');
  }
});

App.Router = Ember.Router.extend({
  rootURL: '/secretkey/pa3/live'
});

App.Store = DS.Store.extend({});

App.ApplicationAdapter = DS.JSONAPIAdapter.extend({
  namespace: '/secretkey/pa3/api/v1'
})

App.Router.map(function() {
  this.route('pic', { path: '/pic/:pic_id' });
  this.route('favorite', { path: '/favorite/:favorite_id' });
  this.route('comment', { path: '/favorite/:comment_id' }); 
  this.route('user', { path: '/user/:username'}) ;
});

App.Pic = DS.Model.extend({
  picurl: DS.attr('string'),
  prevpicid: DS.attr('string'),
  nextpicid: DS.attr('string'),
  caption: DS.attr('string'),
  favorites: DS.hasMany('favorite'),
  comments: DS.hasMany('comment')
});

App.PicRoute = Ember.Route.extend({
  model: function(params) {
    var pic = this.store.findRecord('pic', params.pic_id);
    return pic;
  },

  actions: {
    save: function() {
      var pic = this.modelFor('pic');
      var caption = this.modelFor('pic').get('caption');
      this.set('caption', caption);
      this.modelFor('pic').save();
    }
  },

  renderTemplate: function() {
    this.render('pic');
  }
});

App.Favorite = DS.Model.extend({
  username: DS.attr('string'),
  datetime: DS.attr('date'),
  pic: DS.belongsTo('pic')
});

App.FavoriteRoute = Ember.Route.extend({
  model: function() {
    return this.store.findRecord();
  }
});

App.User = DS.Model.extend({
  username: DS.attr('string'),
  firstname: DS.attr('string'),
  lastname: DS.attr('string')
});

App.UserRoute = Ember.Route.extend({
  model: function() {
    return this.store.findRecord();
  }
});

App.UsernameValidatorService = Ember.Service.extend({

  validateUsername: function(username) {
    var store = this.get('store');
    return store.findRecord('user', username)
   }
});

App.UsernameInputComponent = Ember.Component.extend({

  usernameValidator: Ember.inject.service(),

  focusOut: function() {
    var username = this.get('username')
    this.get('usernameValidator').validateUsername(username)
    .then(function(username) {
      console.log('username ', username, ' exists');
      $('#usernameInputError #error').remove();
    })
    .catch(function(error) {
      $('#usernameInputError').append('<div id="error">Sorry, the username does not exist.</div>');
    });
    var parent = this.get('parentView');
    parent.set('username', username);
  }
});