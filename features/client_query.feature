Feature: Query
	In order to query the Rotten Tomatoes API
	As an Rotten Tomatoes API user
	I want to query the API for a movie of my choice and get it's details
	
	Scenario Outline: Query The Rotten Tomatoes API
		Given I make a new client with <api_key>
		And I query the API for <movie_name>
		Then the results should contain the <movie_name>
	
	Examples:
		| api_key 			 |      movie_name      |
		| "API_KEY_HERE" |       "Hackers"      |
		| "API_KEY_HERE" |  "Gone With the Wind" |
