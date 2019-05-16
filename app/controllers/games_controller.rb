require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    charset = Array('A'..'Z')
    @letters = Array.new(10) { charset.sample }
  end

  def score
    @answer = params['answer']
    result = open("https://wagon-dictionary.herokuapp.com/#{@answer}").read
    h = JSON.parse(result)
    if h['found'] == true
      @finalResult = 'your score is 5'
    else
      @finalResult = '0'
    end
  end
end

