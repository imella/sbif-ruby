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
    
    # Returns todays UF value
    def today(format="json")
      begin
        resp = RestClient.get @endpoint,
                {
                  :params => {
                    :apikey => @@config.sbif_key,
                    :formato => format
                  }
                }
        data = JSON.parse(resp.to_s).to_a.flatten.last
        format_number(data["Valor"])
      rescue
        raise "Error #{resp.response} #{@@config.sbif_key}"
      end
    end
    
    # Returns each day UF value for a whole year
    def year(year, format="json")
      resp = RestClient.get @endpoint+"/#{year}", 
              {
                :params => {
                  :apikey => @@config.sbif_key,
                  :formato => format
                }
              }
      data = JSON.parse(resp.to_s).to_a.flatten
      data.shift
      h = Hash.new
      data.flatten.each { |a| h[a["Fecha"]] = format_number(a["Valor"]) }
      h
    end
    
    
    def month_of_year(month, year, format="json")
      resp = RestClient.get @endpoint+"/#{year}/#{month}", 
              {
                :params => {
                  :apikey => @@config.sbif_key,
                  :formato => format
                }
              }
      data = JSON.parse(resp.to_s).to_a.flatten
      data.shift
      h = Hash.new
      data.flatten.each { |a| h[a["Fecha"]] = format_number(a["Valor"]) }
      h
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