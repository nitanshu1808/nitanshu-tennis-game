# frozen_string_literal: true

class Tennis < BaseService
  GAME_POINTS_OPTIONS = [0, 15, 30, 40]

  attr_accessor :game_score

  def initialize
    @game_score = { player_one: 0, player_two: 0 }
  end

  def call
    game_over = false

    until game_over
      increment_score

      game_over = true if result?
    end
  end

  # equal points for both player
  def deuce?
    game_score[:player_one] + game_score[:player_two] == (GAME_POINTS_OPTIONS.length - 1) * 2
  end

  def increment_score
    player = scored_by
    game[player] = game[player] + 1
  end

  def scored_by
    total_players = game_score.length - 1
    game_score.keys[rand(0..total_players)]
  end

  def result?
    # logic
  end
end

start_game = Tennis.call
