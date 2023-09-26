class GamesController < ApplicationController

  def update
    @user = current_user
    @game = Game.new
    @game.user = @user
    if @game.save!
      redirect_to :root
  end
end
