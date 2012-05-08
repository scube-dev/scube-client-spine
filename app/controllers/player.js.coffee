class PlayerController extends Spine.Controller
  className: 'player'

  events:
    'click [data-type=play-pause-toggle]': 'play_pause_toggle'
    'click [data-type=stop]': 'stop'

  elements:
    '[data-type=play-pause-toggle]': 'button_play_pause_toggle'
    '[data-type=stop]': 'button_stop'

  constructor: ->
    super

    Spine.bind 'tracks:play', (track) =>
      @play_track track

    @active @render()

  render: ->
    @html @view('layout/player')(@current_track)

  change: ->
    @button_play_pause_toggle.text(if @playing() then '▷' else '▶')
    @button_stop.text(if @current_track then '■' else '□')

  play_track: (t) ->
    @current_track = t
    @play()
    @render()
    @change()

  playing: ->
    return false unless @audio
    ! @audio.paused

  play_pause_toggle: ->
    if @playing()
      @pause()
    else
      @resume()

  play: ->
    @destroy_audio() if @audio
    @audio = new Audio
    @audio.src = @current_track.sound_url
    @audio.play()

  pause: ->
    @audio.pause()
    @change()

  resume: ->
    @audio.play()
    @change()

  stop: ->
    return unless @audio
    @audio.pause() if @playing()
    @audio.currentTime = 0
    @change()

  destroy_audio: ->
    @audio.pause()
    @audio.src = ''
    @audio = null


window.PlayerController = PlayerController
