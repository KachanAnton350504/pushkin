require 'json'
require 'pry'

class SecondLevel
  def initialize
    @poems = JSON.parse(load_file('poems'))
    @str_0 = JSON.parse(load_file('str_0'))
  end

  def load_file name
    file = File.read("lib/#{name}.json")
  end

  def search question
    words = question.split(/\s|,| |\.|\?|!|:|;|\(|\)|-|"/)
    words.delete("")
  
    digit_string = ''
    words.each do |word|
      unless word == ''
        digit = @poems[word]
        digit_string = digit_string + digit.to_s + '_'
      end
    end
    @str_0[digit_string]
  end
end