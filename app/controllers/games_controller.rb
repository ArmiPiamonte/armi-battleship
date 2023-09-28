class GamesController < ApplicationController

  def show
    @user = current_user
    @game = Game.find(params[:id])

    @user_board = Board.find_by(game: @game, name: 'you')
    @user_table = @user_board.cells.sort_by { |cell| cell.id}

    @computer_board = Board.find_by(game: @game, name: 'computer')
    @computer_table = @computer_board.cells.sort_by { |cell| cell.id}

    @winner = game_winner
  end

  private

  def game_winner
    if @game.user_won == true
      winner = 'You Won'
    else
      winner = 'Computer Won'
    end
  end
end
