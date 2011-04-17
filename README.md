BadFruit Client For Rotten Tomatoes
===================================

This is a rough gem to interface with the Rotten Tomatoes API.

Prerequisites
-------------

	>gem install badfruit

YOU ARE NOW READY TO GET SOME SWEET MOVIE DATA!

Usage
-----

So there are two main parts of the api, movies and lists. Each of these parts return movie objects, but they are in different contexts. For example. (bf is a BadFruit client instance).

	>bf.lists.newDVDReleases

Will return you an array of movie objects that represent that latest dvd releases. From this array you can execute actions on the individual movies themselves like...

	>movies = bf.lists.newDVDReleases
	 movies[0].fullCast 
	 movies[0].reviews

Very similar to the actual movie section of the api which I've included an example below...

	>require 'badfruit'
	 bf = BadFruit.new("YOUR_API_KEY_HERE")
	 movies = bf.movies.search_by_name("Hackers")
	 cast = movies[0].fullCast
	 reviews = movies[0].reviews

This should get you started, I should also mention that the Lists part of the API has not yet been implemented in this gem. I'll take a look at it soon though.

Version
--------
 The current version of the gem is 0.0.3, I could probably bump it to a 1.0 but..umm, well...who cares.