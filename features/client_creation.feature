Feature: Creation
	In order to create a badfruit client instance
	As an Rotten Tomatoes API user
	I want to create an client instance with my API key
	
	Scenario Outline: Create new client
		Given I make a new client with <api_key>
		Then the result should contain the same <api_key>
		
	Examples:
		| api_key 			 |
		| "API_KEY_HERE" |