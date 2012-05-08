class Session extends Spine.Model
  @configure 'Session', 'email', 'password'
  @extend Spine.Model.Ajax


window.Session = Session
