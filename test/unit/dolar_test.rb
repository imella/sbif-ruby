require 'test_helper'

class DolarTest < Test::Unit::TestCase
  def setup
    @dolar = Sbif::Dolar.new('test')
  end
  
  def test_today_dolar
    puts "Today USD"
    value = @dolar.today
    puts "#{value}"
    assert  value.class == Float 
  end
  
  # def test_year_uf
  #   puts "2010 UF"
  #   value = @uf.year(2010)
  #   assert value.class == Hash
  # end
  # 
  # def test_month_year_uf
  #   puts "02-2011 UF"
  #   value = @uf.month_of_year(1, 2011)
  #   assert value.class == Hash
  # end
  # 
  def test_on_date_dolar
    puts "Dolar: 2012-02-01"
    value = @dolar.on_date(2012, 2, 1)
    assert value == 488.75, "#{value}"
  end
  
end