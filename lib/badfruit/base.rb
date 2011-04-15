module BadFruit
  class Base
    API_KEY = "ccmmqnfen7s4prbjqw348zxc"
    API_VERSION = "v1.0"
    BASE_API_URL = "http://api.rottentomatoes.com/api/public/#{API_VERSION}"
    MOVIES_URL = "#{BASE_API_URL}/movies.json?apikey=#{API_KEY}"
    LISTS_URL = "#{BASE_API_URL}/lists.json?apikey=#{API_KEY}"

    def movies(); @movie || BadFruit::Movies.new(self); end
    
    def get_movie_action(action)
      url = "#{MOVIES_URL}#{action}"
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