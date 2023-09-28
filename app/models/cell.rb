class Cell < ApplicationRecord
  enum status: { link: 0, user_played: 1, computer_played: 2, user_cell: 3, boat_hit: 4}
  belongs_to :board
  has_one :boat
end
