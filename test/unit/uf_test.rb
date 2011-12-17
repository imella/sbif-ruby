require 'test_helper'

class UfTest < Test::Unit::TestCase
  def setup
    @uf = Sbif::Uf.new('test')
  end
  
  def test_today_uf
    puts "Today UF"
    value = @uf.today
    puts "#{value}"
    assert  value.class == Float 
  end
  
  def test_year_uf
    puts "2010 UF"
    value = @uf.year(2010)
    assert value.class == Hash
  end
  
end