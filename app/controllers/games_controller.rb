class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    # Le mot ne peut pas être créé à partir de la grille d’origine.
    @words = params[:score]
    @letters = params[:letters]
    # convertir les deux strings en Array
    @words = @words.split('')
    @letters = @letters.split('')
    # iterer sur larray Words
    @results = @words.all? do |word|
      @letters.include?(word)
    end

    if @results == true

      return "Congratulation"

    else
      return "Bad Game!"

    end

    reponse = RestClient.get ("https://wagon-dictionary.herokuapp.com/#{@words}")
    found = JSON.parse(response)
    if
  end
end
