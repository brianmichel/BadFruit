module BadFruit
  class Base
    attr_accessor :api_key
    API_VERSION = "v1.0"
    MOVIE_DETAIL_BASE_URL = "http://api.rottentomatoes.com/api/public/#{API_VERSION}/movies"
    LISTS_DETAIL_BASE_URL = "http://api.rottentomatoes.com/api/public/#{API_VERSION}/lists"
    
    def movies(); @movie || BadFruit::Movies.new(self); end
    def lists(); @list || BadFruit::Lists.new(self); end
    
    def initialize(key)
      @api_key = key
      @@base_api_url = "http://api.rottentomatoes.com/api/public/#{API_VERSION}"
      @@movies_query_url = "#{@@base_api_url}/movies.json?apikey=#{@api_key}"
      @@lists_query_url = "#{@@base_api_url}/lists.json?apikey=#{@api_key}"
    end
    
    def search_movies(name, page_limit, page)
      url = "#{@@movies_query_url}&q=#{CGI::escape(name)}&page_limit=#{page_limit}&page=#{page}"
      return get(url)
    end
    
    def get_movie_info(movie_id, action)
      url = nil
      case action
      when "details"
        url = "#{MOVIE_DETAIL_BASE_URL}/#{movie_id}.json?apikey=#{@api_key}"
      when "reviews"
        url = "#{MOVIE_DETAIL_BASE_URL}/#{movie_id}/reviews.json?apikey=#{@api_key}"
      when "cast"
        url = "#{MOVIE_DETAIL_BASE_URL}/#{movie_id}/cast.json?apikey=#{@api_key}"
      when "main"
        url = "#{MOVIE_DETAIL_BASE_URL}/#{movie_id}.json?apikey=#{@api_key}"
      else
        puts "Not a valid action"
        return
      end
      return get(url)
    end

    def get_lists_action(action)
      url = nil
      case action
      when "new_releases"
        url = "#{LISTS_DETAIL_BASE_URL}/dvds/new_releases.json?apikey=#{@api_key}"
      when "opening"
        url = "#{LISTS_DETAIL_BASE_URL}/movies/opening.json?apikey=#{@api_key}"
      when "upcoming"
        url = "#{LISTS_DETAIL_BASE_URL}/movies/upcoming.json?apikey=#{@api_key}"
      when "in_theaters"
        url = "#{LISTS_DETAIL_BASE_URL}/movies/in_theaters.json?apikey=#{@api_key}"
      else
        puts "Not a valid action"
        return
      end
      return get(url)
    end

    def get(url)
      data = nil
      resp = HTTParty.get(url)

      if resp.code == 200
        return resp.body
      end
    end

    #Utility Methods For Parsing
    def parse_movies_array(hash)
      moviesArray = Array.new
       hash["movies"].each do |movie|
          moviesArray.push(Movie.new(movie, self))
        end
        return moviesArray
    end

    def parse_movie_array(hash)
      Movie.new(hash, self)
    end

    def parse_actors_array(hash)
      actorsArray = Array.new
       hash["cast"].each do |actor|
         actorsArray.push(Actor.new(actor))
       end
       return actorsArray
    end
  end
end
