class HeaderController extends Spine.Controller
  className: 'header'

  tag: 'header'

  events:
    'click [data-type=playlists-index]': 'playlists'
    'click [data-type=tracks-index]': 'tracks'

  playlists: ->
    @navigate '/playlists'

  tracks: ->
    @navigate '/tracks'

  constructor: ->
    super
    @render()

  render: ->
    @html @view('layout/header')


window.HeaderController = HeaderController
