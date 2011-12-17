require 'json'
require 'rest_client'

module Sbif
  class Uf
    
    attr_accessor :endpoint
    
    def initialize(env = nil)
      @env = env
      @@config ||= Sbif::Config.new(@env)
      @@sbif_base_url ||= @@config.sbif_base_url
      @endpoint = @@sbif_base_url + "uf"
    end
    
    def today(format="json")
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
    
    def year(year, format="json")
      resp = RestClient.get @endpoint+"/#{year}", 
              {
                :params => {
                  :apikey => @@config.sbif_key,
                  :formato => format
                }
              }
      data = JSON.parse(resp.to_s).to_a.flatten.last
      h = Hash.new
      data.flatten.each { |a| h[a["Fecha"]] = a["Valor"].to_f }
      h
    end
    
    private
    
    def format_number(number)
      number.gsub('.', '').gsub(',','.').to_f
    end
    
  end
end