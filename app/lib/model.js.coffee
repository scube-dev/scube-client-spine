Spine.Model.include
  toJSON: ->
    response = {}
    model_name = @constructor.className.toLowerCase()
    response[model_name] = @attributes()
    response
