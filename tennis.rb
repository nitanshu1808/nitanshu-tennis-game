# frozen_string_literal: true

require './base_service'

class Tennis < BaseService
  GAME_POINTS_OPTIONS = %w[0 15 30 40].freeze

  attr_accessor :score

  def initialize(score={ player_one: 0, player_two: 0 })
    @score = score
  end

  def start
    game_over = false

    until game_over
      puts "Deuce #{score}" if scores_equal?(GAME_POINTS_OPTIONS.length - 1)
      update_score

      game_over = true if result?
    end

    puts "Game won by #{leader} scores were #{score}"
  end

  private

  def update_score
    player = scored_by
    score[player] = score[player] + 1

    neutralise_advantage if scores_equal?(GAME_POINTS_OPTIONS.length)
  end

  # equal points for both player
  def scores_equal?(total)
    score[:player_one] + score[:player_two] == total * 2
  end

  # at least four and at least two points more than the opponent.
  def result?
    return false if score[:player_one] == score[:player_two]

    score[leader] >= 4 && (score[leader] - score[trailer] >= 2)
  end

  def scored_by
    total_players = score.length - 1
    player(rand(0..total_players))
  end

  def leader
    score[:player_one] > score[:player_two] ? player(0) : player(1)
  end

  def player(val)
    score.keys[val]
  end

  def trailer
    score[:player_one] < score[:player_two] ? player(0) : player(1)
  end

  # for moving score to deuce state
  def neutralise_advantage
    score.each { |key, value| score[key] = value - 1 }
  end
end

# Tennis.start
