class Main extends Spine.Controller
  className: 'main'

  constructor: ->
    super
    main = new MainStack
    header = new HeaderController

    @routes
      '/': ->
        main.home.active()

    @append header, main


class MainStack extends Spine.Stack
  className: 'main stack'

  controllers:
    sessions: Sessions
    home: HomeController
    playlists: Playlists
    tracks: Tracks

  default: 'sessions'


window.Main = Main
