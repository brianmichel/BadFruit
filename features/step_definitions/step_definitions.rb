require 'badfruit'

Given /I make a new client with "([^"]*)"$/ do |key|
  @badfruit = BadFruit.new("#{key}")
  @badfruit.should_not == nil
end

Given /I query the API for "([^"]*)"$/ do |movie_name|
  @movies = @badfruit.movies.search_by_name("#{movie_name}",50)
end

Given /I fetch the reviews for "([^"]*)"$/ do |movie_name|
  @reviews = @movies[0].reviews
end


Then /the result should contain the same "([^"]*)"$/ do |key|
  @badfruit.api_key.should == key
end

Then /the results should contain the "([^"]*)"$/ do |movie_name|
  movie_to_test = @movies[0]
  should_be_true = movie_to_test.name.include? "#{movie_name}"
  should_be_true.should == true
end

Then /the results should contain reviews/ do
  @reviews.each do |review|
    review.critic.should_not == nil
    review.quote.should_not == nil
    review.publication.should_not == nil
  end
end