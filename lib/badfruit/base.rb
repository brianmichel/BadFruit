module BadFruit
  class Base
    attr_accessor :api_key
    API_VERSION = "v1.0"
    
    def movies(); @movie || BadFruit::Movies.new(self); end
    
    def initialize(key)
      @api_key = key
      @@base_api_url = "http://api.rottentomatoes.com/api/public/#{API_VERSION}"
      @@movies_url = "#{@@base_api_url}/movies.json?apikey=#{@api_key}"
      @@lists_url = "#{@@base_api_url}/lists.json?apikey=#{@api_key}"
    end
    
    def get_movie_action(action)
      url = "#{@@movies_url}#{action}"
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