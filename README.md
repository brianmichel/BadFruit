BadFruit Client For Rotten Tomatoes
===================================

This is a rough gem to interface with the Rotten Tomatoes API.

Usage
-----

	>require 'badfruit'
	bf = BadFruit.new("YOUR_API_KEY_HERE")
	movies = bf.movies.search_by_name("Hackers")
	cast = movies[0].fullCast
	reviews = movies[0].reviews

This should get you started, I should also mention that the Lists part of the API has not yet been implemented in this gem. I'll take a look at it soon though.