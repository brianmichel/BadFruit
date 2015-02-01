module BadFruit
  #
  # Class Base provides a base implementation of the Rotten Tomatoes API.
  #
  class Base
    #
    # @!attribute [rw] api_key
    #   @return [String] The API key used in the client.
    attr_accessor :api_key
    # The version of the API currently supported.
    API_VERSION = "v1.0"
    # The base URL of the API to use in all clients.
    API_BASE_URL = "http://api.rottentomatoes.com/api/public/#{API_VERSION}"
    # The base URL for all movie related API calls.
    MOVIE_DETAIL_BASE_URL = "#{API_BASE_URL}/movies"
    # The base URL for all list related API calls. 
    LISTS_DETAIL_BASE_URL = "#{API_BASE_URL}/lists"
    
    #
    # Returns a façade to all movie related functions.
    #
    # @return [BadFruit::Movies] A façade to all movie related functions.
    # 
    def movies(); @movie || BadFruit::Movies.new(self); end

    #
    # Returns a façade to all list related functions.
    #
    # @return [BadFruit::Lists] A façade to all list related functions.
    # 
    def lists(); @list || BadFruit::Lists.new(self); end
    
    #
    # Initialize a new API client.
    #
    # @param [String] key The API key to use with the client.
    # 
    def initialize(key)
      @api_key = key
      @@base_api_url = "http://api.rottentomatoes.com/api/public/#{API_VERSION}"
      @@movies_query_url = "#{@@base_api_url}/movies.json?apikey=#{@api_key}"
      @@lists_query_url = "#{@@base_api_url}/lists.json?apikey=#{@api_key}"
    end
    
    #


    # Search For A Movie.
    #
    # @param [String] name The name of the movie to search for.
    # @param [Integer] page_limit The number of items to show per page.
    # @param [Integer] page The page of response values to request from the API.
    #
    # @return [Array<BadFruit::Movie>] An array of matching movies.
    # 
    def search_movies(name, page_limit, page)
      url = "#{@@movies_query_url}&q=#{CGI::escape(name)}&page_limit=#{page_limit}&page=#{page}"
      return get(url)
    end

    #
    # Search for similar movies.
    #
    # @param [String] movie_id The id of the movie to locate similar movies for.
    #
    # @return [Array<BadFruit::Movie>] An array of similar movies.
    # 
    def similar_movies(movie_id)
      url = "#{MOVIE_DETAIL_BASE_URL}/#{CGI::escape(movie_id)}/similar.json?apikey=#{@api_key}"
      return get(url)
    end   
 
    #
    # Get various bits of info for a given movie id.
    #
    # @param [String] movie_id The id of the movie to get information for.
    # @param [String] action The type of information to request.
    #
    # @note Valid action values are "details", "reviews", "cast", "main"
    #
    # @return [Hash] A hash of information for a specific movie id.
    # 
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

    #
    # Allows for lookup by id from non Rotten Tomatoes id spaces.
    #
    # @param [String] alias_id The id of the program from another provider.
    # @param [String] type The type of id that is being passed in. (i.e. IMDB, etc.)
    #
    # @return [Hash] A hash of the looked up program details.
    # 
    def get_movie_alias_info(alias_id, type)
      url = "#{API_BASE_URL}/movie_alias.json?id=#{CGI::escape(alias_id)}&type=#{CGI::escape(type)}&apikey=#{@api_key}"
      return get(url)
    end

    #
    # Provides access to the various lists that Rotten Tomatoes provides.
    #
    # @param [String] action The type of list to request.
    #
    # @return [Array<BadFruit::Movie>] An array of programs contains in the requested list.
    # 
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
      when "current_releases"
        url = "#{LISTS_DETAIL_BASE_URL}/dvds/current_releases.json?apikey=#{@api_key}"
      when "upcoming_dvds"
        url = "#{LISTS_DETAIL_BASE_URL}/dvds/upcoming.json?apikey=#{@api_key}"
      when "top_rentals"
        url = "#{LISTS_DETAIL_BASE_URL}/dvds/top_rentals.json?apikey=#{@api_key}"
      else
        puts "Not a valid action"
        return
      end
      return get(url)
    end

    #
    # Parse the movies out of a hash.
    #
    # @param [Hash] hash The has to convert into an array of movies.
    #
    # @return [Array<BadFruit::Movie>] An array of BadFruit::Movie objects.
    # 
    def parse_movies_array(hash)
      moviesArray = Array.new
       hash["movies"].each do |movie|
          moviesArray.push(Movie.new(movie, self))
        end
        return moviesArray
    end

    #

    # Parse a hash into a BadFruit::Movie object.
    #
    # @param [Hash] hash The hash to convert into movie.
    #
    # @return [BadFruit::Movie] The parsed movie object.
    # 
    def parse_movie_array(hash)
      Movie.new(hash, self)
    end

    #
    # Parse the actors out of a movie hash.
    #
    # @param [Hash] hash The movie has to extract the actors out of.
    #
    # @return [Array<BadFruit::Actor>] An array of BadFruit::Actor objects.
    # 
    def parse_actors_array(hash)
      actorsArray = Array.new
       hash["cast"].each do |actor|
         actorsArray.push(Actor.new(actor))
       end
       return actorsArray
    end

    #
    # Get the response of a given URL.
    #
    # @param [String] url The URL to elicit a response from.
    #
    # @return [Hash] The response from the server, or nil if there is no response.
    # 
    def get(url)

      data = nil
      resp = HTTParty.get(url)

      if resp.code == 200
        return resp.body
      end
    end
  end
end

