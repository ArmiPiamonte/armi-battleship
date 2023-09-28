class CellsController < ApplicationController

def update
  @game = Game.find(params[:game_id])
  @computer_board = Board.find_by(game: @game, name: 'computer')
  @cell = Cell.find(params[:id])
  @cell.update(status: 1)
  @game.update(progress: 1)
  computer_move

  winner

  redirect_to game_path(@game)
end

  private

  def computer_move
    @user_board = Board.find_by(game: @game, name: 'you')
    cells = @user_board.cells.where(status: 3)
    @chosen_cell = cells.sample
    @chosen_cell.update(status: 2)
  end

  def winner
    @user_points = @computer_board.cells.where(status: 4).count
    @computer_points = @user_board.cells.where(status: 4).count

    if @user_points == 3
      @game.update(user_won: true, progress: 2)
    elsif @computer_points == 3
      @game.update(progress: 2)
    end
  end

end
