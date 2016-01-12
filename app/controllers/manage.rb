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
      @first_lvl = FirstLevel.new(@question)
      digit_string = @first_lvl.search
      @first_lvl.answer(id_name_of_poem)
    when '2'
      SecondLevel.new.search(@question)
    when '3','4'
      ThirdLevel.new(@question).search
    end
  end
end