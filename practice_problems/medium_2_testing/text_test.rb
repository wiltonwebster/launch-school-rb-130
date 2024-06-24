require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @my_file = File.open('sample_text.txt')
    @sample_text = Text.new(@my_file.read)
  end
  
  def test_swap
    expected_text = <<~SWAPPED_TEXT.chomp
    Lorzm ipsum dolor sit amzt, conszctztur adipiscing zlit. Cras szd vulputatz ipsum.
    Suspzndissz commodo szm arcu. Donzc a nisi zlit. Nullam zgzt nisi commodo, volutpat
    quam a, vivzrra mauris. Nunc vivzrra szd massa a condimzntum. Suspzndissz ornarz justo
    nulla, sit amzt mollis zros sollicitudin zt. Etiam maximus molzstiz zros, sit amzt dictum
    dolor ornarz bibzndum. Morbi ut massa nzc lorzm tincidunt zlzmzntum vitaz id magna. Cras
    zt varius mauris, at pharztra mi.
    SWAPPED_TEXT
    
    actual_text = @sample_text.swap('e', 'z')
    
    assert_equal(expected_text, actual_text)
  end
  
  def test_word_count
    assert_equal(72, @sample_text.word_count)
  end
  
  def teardown
    @my_file.close
  end
end