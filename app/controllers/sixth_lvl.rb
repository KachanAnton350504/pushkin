require 'json'
require 'pry'

class SixthLvl
  def initialize question
    @question = ' ' + question.delete(' ')
    @str_sort = JSON.parse(load_file('str_sort'))
  end

  def load_file name
    file = File.read("lib/#{name}.json")
  end

  def search
    question_sotr = @question.split("").sort.join
    @str_sort[question_sotr]
    #binding.pry
  end

end