require 'json'
require 'pry'

class FirstLevel
  def initialize question
    @question = question
    @poems = JSON.parse(load_file('poems'))
    @poems_name = JSON.parse(load_file('poems_name'))
  end

  def load_file name
    file = File.read("lib/#{name}.json")
  end

  def search
    qstring_of_poem = @question.split(/\s|,| |\.|\?|!|:|;|\(|\)|-|"/)
    qstring_of_poem.delete("")
    id_name_of_poem = ''
    qstring_of_poem.each do |word|
      unless word == ''
        id_word_poem = @poems[word]
        id_name_of_poem += id_word_poem.to_s + '_'
      end
    end
    id_name_of_poem
  end

  def answer id_name_of_poem
    @poems_name[id_name_of_poem]
  end
end