class Game < ApplicationRecord
  enum progress: {started: 0, in_progress: 1, end: 2}
  belongs_to :user
end
