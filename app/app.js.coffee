#= require json2
#= require jquery-1.7.1

#= require spine-1.0.6/spine
#= require spine-1.0.6/manager
#= require spine-1.0.6/ajax
#= require spine-1.0.6/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views


class App extends Spine.Controller
  constructor: ->
    super

    Spine.Model.host = 'http://localhost:3000/api/v0'

    Spine.Route.history = true

    @playlists = new Playlists
    @sessions = new Sessions

    @append @playlists, @sessions

    Spine.Route.setup()

    @navigate '/sessions/new'

window.App = App


$ ->
  $('body').html('<div id="app"></div>')
  new App({el: $('#app')})
