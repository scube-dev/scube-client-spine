class Track extends Spine.Model
  @configure 'Track', 'name', 'sound_url'
  @extend Spine.Model.Ajax


window.Track = Track
