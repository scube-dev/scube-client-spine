class New extends Spine.Controller
  className: 'new'

  events:
    'submit form': 'submit'

  constructor: ->
    super
    @active @render

  render: ->
    @html @view('sessions/new')

  submit: (e) ->
    e.preventDefault()
    @session = Session.fromForm(e.target)
    @session.bind 'ajaxSuccess', (record, data, status, xhr) =>
      @navigate '/'
    @session.save()


class Sessions extends Spine.Stack
  className: 'sessions stack'

  controllers:
    new:    New

  routes:
    '/sessions/new': 'new'


window.Sessions = Sessions
