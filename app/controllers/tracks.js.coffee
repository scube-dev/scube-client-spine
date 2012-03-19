class Index extends Spine.Controller
  className: 'index'

  events:
    'click [data-type=playlists]': 'playlists'
    'click [data-type=play]': 'play'

  constructor: ->
    super
    Track.bind 'refresh change', @render
    @need_fetch = true
    @active @on_active

  on_active: =>
    Track.fetch() if @need_fetch
    @need_fetch = false
    true

  render: =>
    tracks = Track.all()
    @html @view('tracks/index')(tracks: tracks)

  playlists: (e) ->
    @navigate '/playlists'

  play: (e) =>
    track = Track.find($(e.target).item_id())
    audio = new Audio
    audio.src = track.sound_url
    audio.play()


class Tracks extends Spine.Stack
  className: 'tracks stack'

  controllers:
    index: Index

  routes:
    '/tracks': 'index'


window.Tracks = Tracks
