require 'open-uri'
require 'json'



module DataAPI
  class GerarPalavra
    attr_reader :URL_API, :data
    @data = {}
    @URL_API = "http://papalavras-server.herokuapp.com/words/random/"
    def self.gerar
      URI.open(@URL_API) do |json|
        json.each_line {|data_api| @data = data_api}
      end
      @data = JSON.parse(@data)
      @data
    end
  end
end

DataAPI::GerarPalavra.gerar