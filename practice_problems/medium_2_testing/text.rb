class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

my_file = File.open('sample_text.txt')
text = Text.new(my_file.read)

puts text.word_count

my_file.close