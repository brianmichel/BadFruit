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
