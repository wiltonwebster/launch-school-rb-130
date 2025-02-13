# Text Analyzer - Sandwich Code

=begin
Fill out the rest of the Ruby code below so it prints output like that shown in
"Sample Output." You should read the text from a simple text file that you
provide. (We also supply some example text below, but try the program with your
text as well.)

Read the text file in the #process method and pass the text to the block 
provided in each call. Everything you need to work on is either part of the 
#process method or part of the blocks. You need no other additions or changes.

The text you use does not have to produce the same numbers as the sample output
but should have the indicated format.
=end

class TextAnalyzer
  def process
    file = File.open "sample_text.txt"
    yield file.read
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split.size} words" }