class Main extends Spine.Controller
  className: 'main'

  constructor: ->
    super
    main = new MainStack
    header = new HeaderController

    @routes
      '/': ->
        @prepend header
        main.home.active()

    @append main


class MainStack extends Spine.Stack
  className: 'main stack'

  controllers:
    sessions: Sessions
    home: HomeController
    playlists: Playlists
    tracks: Tracks

  default: 'sessions'


window.Main = Main
