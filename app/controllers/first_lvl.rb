require 'json'
require 'pry'

class FirstLvl
  def initialize question
    @question = question
    @word_digit = JSON.parse(load_file('word_digit'))
    @str_name = JSON.parse(load_file('str_name'))
  end

  def load_file name
    file = File.read("lib/#{name}.json")
  end

  def search
    words = @question.split(/\s|,| |\.|\?|!|:|;|\(|\)|-|"/)
    words.delete("")
    digit_string = ''
    #binding.pry
    words.each do |word|
      unless word == ''
        digit = @word_digit[word]
        digit_string = digit_string + digit.to_s + '_'
      end
    end
    digit_string
  end

  def answer digit_string
    @str_name[digit_string]
  end
end