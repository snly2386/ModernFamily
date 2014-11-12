class ModernFamily.Landing extends Backbone.View

	className:  'landing'

	template: JST['templates/landing']

	initialize: (options) ->
		@app = options.app
		@episodes = options.episodes
		@current_season = ""
		@current_episode = ""

		@episodes.fetch
			success: (model, response, options) =>
				@render()
				@position()
				@resize_video()
				@init_wow()
				@season_1()
				@season_2()
				@season_3()
				@season_4()
				@season_5()

	events: 
		'mouseenter .title'   : 'log'
		'click .down-arrow'   : 'scroll'
		'click .close'		  : 'close_season'
		'click .season-image' : 'open_season'
		'click .launch-player': 'play_video'
		'click .close-video'  : 'close_video'
		'click .next-episode' : 'next_episode'

	next_episode: ->
		current_episode = @$('video source').attr('src')
		array = current_episode.split("")
		current_season = array[10]
		current = ""
		next = ""
		if current_episode.length is 17 
			current = parseInt(array[12])
		else 
			next_number = array.splice(12,2).join("")
			current = parseInt(next_number)

		if current != 24
			next = current+=1
		else 
			next = 1

		next_episode = "../videos/#{current_season}-#{next}.mp4"
		@$('video source').attr('src', next_episode)
		@next_video(next_episode)

	next_video: (next_episode)->
		@$('video').load()

	close_video: ->
		@$('.video-player-container').fadeOut(1000)
		@$('.video-player-container').removeClass('bounceInDown')
		@$('.video-overlay').fadeOut(1000)
		@$('.close-video').fadeOut(1000)
		@$('video')[0].pause()

	play_video: (e)->
		file = $(e.currentTarget).data('file')
		console.log file
		@$('.video-player-container').html("<section class='video-player centered'>
		<video controls width='100%' height='70%'' autoplay='true'>
		<source src='../videos/#{file}' type='video/mp4'>
		</video></section>")
		@$(".video-player-container").append("<div class='next-episode centered'>
		<i class='fa fa-arrow-right'></i>
		<h1>Next Episode</h1>
	</div>")
		@$('.video-overlay').fadeIn(1000)
		@$('.close-video').fadeIn(1000)
		@$('.video-player-container').show().addClass('animated bonceInDown')
 
	open_season: (e)->
		season = $(e.currentTarget).data('season')
		@current_season = season
		console.log @current_season
		@$('.overlay').fadeIn(1000)
		switch @current_season
			when 1 then $('.season1-container').fadeIn(1000)
			when 2 then $('.season2-container').fadeIn(1000)
			when 3 then $('.season3-container').fadeIn(1000)
			when 4 then $('.season4-container').fadeIn(1000)
			when 5 then $('.season5-container').fadeIn(1000)
			when 6 then $('.season6-container').fadeIn(1000)

	init_wow: ->
		new WOW().init()

	close_season: ->
		switch @current_season 
			when 1 then $('.season1-container').fadeOut(1000)
			when 2 then $('.season2-container').fadeOut(1000)
			when 3 then $('.season3-container').fadeOut(1000)
			when 4 then $('.season4-container').fadeOut(1000)
			when 5 then $('.season5-container').fadeOut(1000)
			when 6 then $('.season6-container').fadeOut(1000)

		@$(".overlay").fadeOut(1000)

	season_1: ->
		season1 = @episodes.where(season: 1)
		season1.forEach( (model)->
			$('.season1-row').append("<div class='launch-player season1-video ih-item square effect4' id='season1' data-file='#{model.get('file')}'><a href='#'>
				<div class='img'><img src='assets/mf_1.jpg'/></div>
				<div class='mask1'></div>
        		<div class='mask2'></div>
				<div class='info'>
          			<h3>Season #{model.get('season')}</h3>
          			<p>Epsiode #{model.get('number')}</p>
       			 </div></a>")
			)

	season_2: ->
		season2 = @episodes.where(season: 2)
		season2.forEach( (model)->
			$('.season2-row').append("<div class='launch-player season2-video ih-item square effect4' id='season2' data-file='#{model.get('file')}'><a href='#'>
				<div class='img'><img src='assets/mf_2.jpg'/></div>
				<div class='mask1'></div>
        		<div class='mask2'></div>
				<div class='info'>
          			<h3>Season #{model.get('season')}</h3>
          			<p>Epsiode #{model.get('number')}</p>
       			 </div></a>")
			)

	season_3: ->
		season3 = @episodes.where(season: 3)
		season3.forEach( (model)->
			$('.season3-row').append("<div class='launch-player season3-video ih-item square effect4' id='season3' data-file='#{model.get('file')}'><a href='#'>
				<div class='img'><img src='assets/mf_3.jpg'/></div>
				<div class='mask1'></div>
        		<div class='mask2'></div>
				<div class='info'>
          			<h3>Season #{model.get('season')}</h3>
          			<p>Epsiode #{model.get('number')}</p>
       			 </div></a>")
			)

	season_4: ->
		season4 = @episodes.where(season: 4)
		season4.forEach( (model)->
			$('.season4-row').append("<div class='launch-player season4-video ih-item square effect4' id='season4' data-file='#{model.get('file')}'><a href='#'>
				<div class='img'><img src='assets/mf_4.jpg'/></div>
				<div class='mask1'></div>
        		<div class='mask2'></div>
				<div class='info'>
          			<h3>Season #{model.get('season')}</h3>
          			<p>Epsiode #{model.get('number')}</p>
       			 </div></a>")
			)
	season_5: ->
		season5 = @episodes.where(season: 5)
		season5.forEach( (model)->
			$('.season5-row').append("<div class='launch-player season5-video ih-item square effect4' id='season5' data-file='#{model.get('file')}'><a href='#'>
				<div class='img'><img src='assets/mf_5.jpg'/></div>
				<div class='mask1'></div>
        		<div class='mask2'></div>
				<div class='info'>
          			<h3>Season #{model.get('season')}</h3>
          			<p>Epsiode #{model.get('number')}</p>
       			 </div></a>")
			)

	scroll: ->
		scrollElement = document.getElementById("season1")
		console.log scrollElement.scrollHeight
		$('body').animate({scrollTop: 700}, 1000)

	resize_video: ->
		width = $(window).width()
		height = $(window).height()
		@$('.video').css({'height': height})

	render: ->
		@$el.html @template()

	position: ->
		$('body').html @$el