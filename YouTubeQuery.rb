require 'open-uri'
require 'cgi'
  
class YouTubeQuery  
  
  def initialize()
    @endpoint = 'https://youtube.com/get_video_info?video_id='
    @key = 'hlsvp'
  end  
  
  def query
    begin  
      contents = open(@endpoint + ARGV[0]) { |file| file.read }
    rescue
      _error
    else
      result = _parse(contents)
      
      # relevant key not found, error out
      if (!result.has_key?(@key))
        _error
        return
      end

      puts result[@key]
    end
  end

  private
    def _error
      puts '0'
    end

  private
    def _parse(str)
      return CGI::parse(str)
    end

end

d = YouTubeQuery.new
d.query
