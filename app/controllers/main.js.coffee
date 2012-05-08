class Main extends Spine.Controller
  className: 'main'

  constructor: ->
    super
    main = new MainStack
    header = new HeaderController
    @append header, main


class MainStack extends Spine.Stack
  className: 'main stack'

  controllers:
    sessions: Sessions
    playlists: Playlists
    tracks: Tracks

  default: 'sessions'


window.Main = Main
