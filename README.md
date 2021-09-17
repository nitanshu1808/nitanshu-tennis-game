# Tennis Game

* The repository contains a simulation of a simple tennis game with relevant test specs.

# Problem

* Write a program that simulates a simple tennis game. * Scores from zero to three points are described as “love”, “fifteen”, “thirty”, and “forty” respectively. * If at least three points have been scored by each side and a player has one more point than his opponent, the score of the game is “advantage” for the player in the lead. * If at least three points have been scored by each player, and the scores are equal, the score is “deuce”. * A game is won by the first player to have won at least four points in total and at least two points more than the opponent.

# Solution

* Consider the algorithmic solution for the problem:

1. Define a hash with default scores for both players

2. Begin the game

3. Assign a winning point randomly to a player

4. Increment/Decrement the score depending upon the condition(deuce, advantage etc).

  . Deuce = scores are equal for both the players
  . Advantage = If deuce and one player has an extra point.

5. End the game if result has been declared

## Testing
In order to run the test.

rspec spec/tennis_spec.rb

