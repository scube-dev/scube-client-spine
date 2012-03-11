$ = jQuery.sub()

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Playlist.find(elementID)


class Index extends Spine.Controller
  className: 'index'

  events:
    'click [data-type=show]': 'show'
    'click [data-type=new]': 'new'

  constructor: ->
    super
    Playlist.bind 'refresh change', @render
    Playlist.fetch()

  render: =>
    playlists = Playlist.all()
    @html @view('playlists/index')(playlists: playlists)

  show: (e) ->
    item = $(e.target).item()
    @navigate '/playlists', item.id

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
    alert('save!')

  back: ->
    @navigate '/playlists'


class Playlists extends Spine.Stack
  className: 'playlists stack'

  controllers:
    index:  Index
    show:   Show
    new:    New

  default: 'index'

  routes:
    '/playlists/new': 'new'
    '/playlists/:id': 'show'
    '/playlists':     'index'


window.Playlists = Playlists
