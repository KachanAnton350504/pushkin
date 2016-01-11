require 'net/http'
require 'pry'
require_relative "./manage.rb"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  def registration
    token = params[:token]
    question = params[:question]
    File.write("lib/token.txt",token)
    Rails.logger.fatal("Token: #{token}")
    render json: {answer: 'мглою'}
  end

  def quiz
    answer = Manage.new(params).level_manage
    token = File.read("lib/token.txt")
    uri = URI("http://pushkin.rubyroid.by/quiz")
    parameters = {
      answer: answer,
      token: token,
      task_id: params[:id]
    }
    render nothing: true
    Rails.logger.fatal("Parameters: #{parameters}")
    Net::HTTP.post_form(uri, parameters)
  end
end
