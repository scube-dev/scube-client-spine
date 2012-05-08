class Track extends Spine.Model
  @configure 'Track', 'name', 'sound_url'
  @extend Spine.Model.Ajax

  play: ->
    Spine.trigger 'tracks:play', @


window.Track = Track
