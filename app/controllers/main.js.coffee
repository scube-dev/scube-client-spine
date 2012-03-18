class Main extends Spine.Controller
  className: 'main'

  constructor: ->
    super
    main = new MainStack()
    @append main


class MainStack extends Spine.Stack
  className: 'main stack'

  controllers:
    sessions: Sessions
    playlists: Playlists

  default: 'sessions'


window.Main = Main
