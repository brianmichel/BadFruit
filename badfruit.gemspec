# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{badfruit}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Michel"]
  s.cert_chain = ["/Users/brianmichel/gem-public_cert.pem"]
  s.date = %q{2011-07-14}
  s.description = %q{Interface with the Rotten Tomatoes API}
  s.email = %q{brian.michel@gmail.com}
  s.extra_rdoc_files = ["LICENSE", "README.md", "lib/badfruit.rb", "lib/badfruit/Actors/actor.rb", "lib/badfruit/Lists/lists.rb", "lib/badfruit/Movies/movie.rb", "lib/badfruit/Movies/movies.rb", "lib/badfruit/Posters/posters.rb", "lib/badfruit/Reviews/review.rb", "lib/badfruit/Scores/scores.rb", "lib/badfruit/base.rb"]
  s.files = ["LICENSE", "Manifest", "README.md", "Rakefile", "features/client_creation.feature", "features/client_query.feature", "features/client_reviews.feature", "features/step_definitions/step_definitions.rb", "lib/badfruit.rb", "lib/badfruit/Actors/actor.rb", "lib/badfruit/Lists/lists.rb", "lib/badfruit/Movies/movie.rb", "lib/badfruit/Movies/movies.rb", "lib/badfruit/Posters/posters.rb", "lib/badfruit/Reviews/review.rb", "lib/badfruit/Scores/scores.rb", "lib/badfruit/base.rb", "badfruit.gemspec"]
  s.homepage = %q{http://www.github.com/brianmichel/badfruit}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Badfruit", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{badfruit}
  s.rubygems_version = %q{1.7.2}
  s.signing_key = %q{/Users/brianmichel/gem-private_key.pem}
  s.summary = %q{Interface with the Rotten Tomatoes API}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
  end
end
