Feature: Reviews
	In order to get reviews for a movie
	As an Rotten Tomatoes API user
	I want to query the API for a movie of my choice and then get it's reviews
	
	Scenario Outline: Get Reviews For Specific Movie
		Given I make a new client with <api_key>
		And I query the API for <movie_name>
		And I fetch the reviews for <movie_name>
		Then the results should contain reviews
	
	Examples:
		| api_key 			 |      movie_name      |
		| "API_KEY_HERE" |       "Hackers"      |
		| "API_KEY_HERE" | "Gone With the Wind" |
    
	Scenario Outline: Get Information For Specific Movie by id
		Given I make a new client with <api_key>
		And I query the API for <movie_id>
		And I fetch the info for <movie_id>
		Then the results should contain movie info
	
	Examples:
		| api_key 			 |      movie_id      |
		| "API_KEY_HERE" |       770671942      |

	Scenario Outline: Get Similar movies by id
		Given I make a new client with <api_key>
		And I query the API for <similar_movie_id>
		And I fetch the similar movies for <similar_movie_id>
		Then the results should contain similar movies
	
	Examples:
		| api_key 			 |      similar_movie_id      |
		| "API_KEY_HERE" |       326459204      |
