require_relative "./first_lvl.rb"
require_relative "./second_lvl.rb"
require 'pry'

class Manage
  def initialize (params)
    @question = params[:question]
    @id = params[:id]
    @level = params[:level]
  end

  def level_manage
    case @level.to_s
    when '1'
      @first_lvl = FirstLvl.new(@question)
      digit_string = @first_lvl.search
      @first_lvl.answer(digit_string)
    when '2'
      SecondLvl.new.search(@question)
    when '3','4'
      ThirdLvl.new(@question).search
    when '5'
      FifthLvl.new(@question).search
    when '6','7'
      SixthLvl.new(@question).search
    when '8'
      EighthLvl.new(@question).search
    end
  end
end