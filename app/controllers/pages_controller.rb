class PagesController < ApplicationController

  def home
    set_up_game
    redirect_to game_path(@game)
  end

  private

  def set_up_game
    @user = current_user
    @game = Game.create!(progress: 0, user: @user)
    create_user_table
    create_computer_table
  end

  def create_user_table
    user_board = Board.create!(name: 'you', game: @game)

    25.times do
      Cell.create!(board: user_board, status: 3)
    end

    cells = Cell.where(board: user_board)
    unique_index = (0..24).to_a.shuffle

    Boat.create!(cell: cells[unique_index.pop])
    Boat.create!(cell: cells[unique_index.pop])
    Boat.create!(cell: cells[unique_index.pop])
  end

  def create_computer_table
    computer_board = Board.create!(name: 'computer', game: @game)

    25.times do
      Cell.create!(board: computer_board, status: 0)
    end

    cells = Cell.where(board: computer_board, status: 0)
    unique_index = (0..24).to_a.shuffle

    Boat.create!(cell: cells[unique_index.pop])
    Boat.create!(cell: cells[unique_index.pop])
    Boat.create!(cell: cells[unique_index.pop])

    cells.shuffle
  end

end
