require 'json'
require 'pry'

class ThirdLvl
  def initialize question
    @question = question
  end

  def search 
  	second = SecondLvl.new
  	answer = ''
  	split_qutstion = @question.split("\n")
  	split_qutstion.each do |quest|
      ans = second.search(quest)
      answer += ",#{ans}"
  	end
    answer[1..-1]
  end
end