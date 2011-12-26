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
  
  def test_month_year_uf
    puts "02-2011 UF"
    value = @uf.month_of_year(1, 2011)
    assert value.class == Hash
  end
  
  def test_on_date_uf
    puts "2011-02-01"
    value = @uf.on_date(2011, 2, 1)
    assert value == 21477.70, "#{value}"
  end
  
end