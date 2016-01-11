require 'json'
require 'pry'

class FifthLvl
  def initialize question
    @question = question
    @str_0 = JSON.parse(load_file('str_0'))
  end

  def load_file name
    file = File.read("lib/#{name}.json")
  end

  def search
    input_string = @question.split(/\s|,| |\.|\?|!|:|;|\(|\)|-|"/)
    input_string.delete("")
    digit_string = FirstLvl.new(@question).search
    answer_array = []
    answer_string = ''
    digit_array = digit_string.split('_')
    digit_array.count.times do |i|
      elem = digit_array[i]
      digit_array[i] = '0'
      test_string = digit_array.join('_')
      answer_array << @str_0[test_string + '_']
      digit_array[i] = elem
      answer_string = answer_array[i] + ',' + input_string[i] if answer_array[i]
    end
    #binding.pry
    answer_string
  end

end
