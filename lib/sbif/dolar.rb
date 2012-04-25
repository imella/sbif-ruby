require 'json'
require 'rest_client'

module Sbif
  class Dolar
    attr_accessor :endpoint
    
    def initialize(env = nil)
      @env = env
      @@config ||= Sbif::Config.new(@env)
      @@sbif_base_url ||= @@config.sbif_base_url
      @endpoint = @@sbif_base_url + "dolar"
    end
    
    def today format="json"
      resp = RestClient.get @endpoint,
              {
                :params => {
                  :apikey => @@config.sbif_key,
                  :formato => format
                }
              }
      data = JSON.parse(resp.to_s).to_a.flatten.last
      format_number(data["Valor"])
    end
    
    def on_date(year, month, day, format="json")
      resp = RestClient.get @endpoint+"/#{year}/#{month}/#{day}", 
              {
                :params => {
                  :apikey => @@config.sbif_key,
                  :formato => format
                }
              }
      data = JSON.parse(resp.to_s).to_a.flatten.last
      format_number(data["Valor"])
    end
    
    private
    
    def format_number(number)
      number.gsub('.', '').gsub(',','.').to_f
    end
  end
end