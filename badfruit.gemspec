# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "badfruit"
  s.version = "1.3.0"

  s.authors = ["Brian Michel"]
  s.date = Date.today.to_s
  s.email = "brian.michel@gmail.com"
  s.extra_rdoc_files = ["LICENSE", "README.md", "lib/badfruit.rb", "lib/badfruit/Actors/actor.rb", "lib/badfruit/Lists/lists.rb", "lib/badfruit/Movies/movie.rb", "lib/badfruit/Movies/movies.rb", "lib/badfruit/Posters/posters.rb", "lib/badfruit/Reviews/review.rb", "lib/badfruit/Scores/scores.rb", "lib/badfruit/base.rb"]
  s.files = ["LICENSE", "Manifest", "README.md", "Rakefile", "features/client_creation.feature", "features/client_query.feature", "features/client_reviews.feature", "features/step_definitions/step_definitions.rb", "lib/badfruit.rb", "lib/badfruit/Actors/actor.rb", "lib/badfruit/Lists/lists.rb", "lib/badfruit/Movies/movie.rb", "lib/badfruit/Movies/movies.rb", "lib/badfruit/Posters/posters.rb", "lib/badfruit/Reviews/review.rb", "lib/badfruit/Scores/scores.rb", "lib/badfruit/base.rb", "badfruit.gemspec"]
  s.homepage = "http://www.github.com/brianmichel/badfruit"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Badfruit", "--main", "README.md"]
  s.rubyforge_project = "badfruit"
  s.license = 'MIT'
  s.summary = "Interface with the Rotten Tomatoes API"

  s.add_dependency('json', [">= 0"])
  s.add_dependency('httparty', [">= 0"])
  s.add_development_dependency('cucumber', [">= 0"])
end
