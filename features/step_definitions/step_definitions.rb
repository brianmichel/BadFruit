$:.push(File.expand_path('../../../lib', __FILE__))
require 'badfruit'

Given /I make a new client with "([^"]*)"$/ do |key|
  @badfruit = BadFruit.new("#{key}")
  expect(@badfruit).not_to eq(nil)
end

Given /I query the API for "([^"]*)"$/ do |movie_name|
  @movies = @badfruit.movies.search_by_name("#{movie_name}",50)
  puts @movies
end

Given /^I query the API for (\d+)$/ do |movie_id|
  @movie = @badfruit.movies.search_by_id("#{movie_id}")
end

Given /I fetch the reviews for "([^"]*)"$/ do |movie_name|
  @reviews = @movies[0].reviews
end

Given /^I fetch the similar movies for (\d+)$/ do |similar_movie_id|
  @similar_movies = @badfruit.similar_movies(similar_movie_id.to_s)
end

Given /^I fetch the info for (\d+)$/ do |movie_id|
  @info = @movie.info
end


Then /the result should contain the same "([^"]*)"$/ do |key|
  expect(@badfruit.api_key).to eq(key)
end

Then /the results should contain the "([^"]*)"$/ do |movie_name|
  movie_to_test = @movies[0]
  should_be_true = (movie_to_test.name =~ /movie_name/i) != nil
  expect(should_be_true).to eq(true)
end

Then /^the results should contain similar movies$/ do
  expect(@similar_movies).not_to eq(nil)
end

Then /the results should contain reviews/ do
  @reviews.each do |review|
    expect(review.critic).not_to eq(nil)
    expect(review.quote).not_to eq(nil)
    expect(review.publication).not_to eq(nil)
  end
end

Then /^the results should contain movie info$/ do
  expect(@info).not_to eq(nil)
end

