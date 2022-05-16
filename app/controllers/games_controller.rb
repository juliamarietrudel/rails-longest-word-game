require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10).join(' ')
  end

  def score
    @final_score = english_word? && included_letters?
  end

  def english_word?
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}").read
    data = JSON.parse(response)
    data = data['found']
    if data == false
      return true
    else
      return false
    end
  end

  def included_letters?
    @included_score = true
    @word.each do |letter|
      if !@letters.include?(letter)
        @included_score == false
      end
    end
    @included_score
  end
end


# # maybe 2
# @word = params[:word]
# @wordd = @word.split


# # maybe 3
# @word.find do |letter|
#   letter.include?(@letters)
# end


# # maybe 4
# @word.select { |element| @letters.include(element) }
