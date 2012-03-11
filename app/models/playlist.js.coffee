class Playlist extends Spine.Model
  @configure 'Playlist', 'name'
  @extend Spine.Model.Ajax

  @url: ->
    Spine.Model.host + '/api/v0/playlists.json'


window.Playlist = Playlist
