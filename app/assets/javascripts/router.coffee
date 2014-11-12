class ModernFamily.Router extends Backbone.Router

  initialize: ->
    Backbone.history.start()

  routes: ->
  	'' : 'landing'

  landing: ->
  	@create_episodes()
  	view = new ModernFamily.Landing app: @, episodes: @episodes

  create_episodes: ->
  	@episodes ||= new ModernFamily.Episodes()