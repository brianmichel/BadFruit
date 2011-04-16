module BadFruit
  class Base
    attr_accessor :api_key
    API_VERSION = "v1.0"
    MOVIE_DETAIL_BASE_URL = "http://api.rottentomatoes.com/api/public/#{API_VERSION}/movies"
    LISTS_DETAIL_BASE_URL = "http://api.rottentomatoes.com/api/public/#{API_VERSION}/lists"
    
    def movies(); @movie || BadFruit::Movies.new(self); end
    
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
      else
        puts "Not a valid action"
        return
      end
      return get(url)
    end

    def get_lists_action(action)
    end

    def get(url)
      data = nil
      puts "Getting #{url}"
      resp = HTTParty.get(url)

      if resp.code == 200
        puts "Response: OK"
        return resp.body
      end
    end
  end
end