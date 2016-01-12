require 'json'
require 'pry'

class SecondLvl
  def initialize
    @word_digit = JSON.parse(load_file('word_digit'))
    @str_0 = JSON.parse(load_file('str_0'))
  end

  def load_file name
    file = File.read("lib/#{name}.json")
  end

  def search question
    words = question.split(/\s|,| |\.|\?|!|:|;|\(|\)|-|"/)
    words.delete("")
    #binding.pry
    digit_string = ''
    words.each do |word|
      unless word == ''
        digit = @word_digit[word]
        digit_string = digit_string + digit.to_s + '_'
      end
    end
    #binding.pry
    @str_0[digit_string]
  end
end