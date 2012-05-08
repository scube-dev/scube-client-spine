class Index extends Spine.Controller
  className: 'index'

  events:
    'click [data-type=show]': 'show'
    'click [data-type=new]': 'new'

  constructor: ->
    super
    Playlist.bind 'refresh change', @render
    @need_fetch = true
    @active @on_active

  on_active: =>
    Playlist.fetch() if @need_fetch
    @need_fetch = false
    true

  render: =>
    playlists = Playlist.all()
    @html @view('playlists/index')(playlists: playlists)

  show: (e) ->
    playlist = Playlist.find($(e.target).item_id())
    @navigate '/playlists', playlist.id

  new: (e) ->
    @navigate '/playlists/new'


class Show extends Spine.Controller
  className: 'show'

  events:
    'click [data-type=back]': 'back'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = Playlist.find(id)
    @render()

  render: ->
    @html @view('playlists/show')(@item)

  back: ->
    @navigate '/playlists'


class New extends Spine.Controller
  className: 'new'

  events:
    'click [data-type=back]': 'back'
    'submit form':            'submit'

  constructor: ->
    super
    @active @render

  render: ->
    @html @view('playlists/new')

  submit: (e) ->
    e.preventDefault()
    playlist = Playlist.fromForm(e.target).save()
    @navigate '/playlists' if playlist

  back: ->
    @navigate '/playlists'


class Playlists extends Spine.Stack
  className: 'playlists stack'

  controllers:
    index:  Index
    show:   Show
    new:    New

  routes:
    '/playlists/new': 'new'
    '/playlists/:id': 'show'
    '/playlists':     'index'


window.Playlists = Playlists
