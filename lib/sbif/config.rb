require 'yaml'

module Sbif
  class Config
    
    SBIF_BASE_URL = 'http://api.sbif.cl/api-sbif/recursos/'
    
    attr_accessor :config_filepath, :sbif_base_url, :sbif_key
    
    def initialize(env = nil)
      if env
        @config_filepath = File.join(File.dirname(__FILE__), "..", "..", "config", "sbif.yml")
        load(env)
      else
        @config_filepath = File.join(Rails.root, "config", "sbif.yml")
        load(Rails.env)
      end
    end
    
    def load(env)
      config          = YAML.load_file(@config_filepath)[env]
      @sbif_key       = config['sbif_key']
      @sbif_base_url  = SBIF_BASE_URL
    end
    
  end
end