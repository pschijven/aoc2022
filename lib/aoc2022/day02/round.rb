class Round

  # Score definitions
  WIN = 6
  DRAW = 3
  LOSE = 0

  ROCK = 1
  PAPER = 2
  SCISSORS = 3

  # Score Matrix
  SCORES = {
    "A X" => ROCK + DRAW,
    "A Y" => PAPER + WIN,
    "A Z" => SCISSORS + LOSE,
    "B X" => ROCK + LOSE,
    "B Y" => PAPER + DRAW,
    "B Z" => SCISSORS + WIN,
    "C X" => ROCK + WIN,
    "C Y" => PAPER + LOSE,
    "C Z" => SCISSORS + DRAW
  }

  ENCRYPTED_SCORE = {
    "A X" => LOSE + SCISSORS,
    "A Y" => DRAW + ROCK,
    "A Z" => WIN + PAPER,
    "B X" => LOSE + ROCK,
    "B Y" => DRAW + PAPER,
    "B Z" => WIN + SCISSORS,
    "C X" => LOSE + PAPER,
    "C Y" => DRAW + SCISSORS,
    "C Z" => WIN + ROCK
  }

  def self.score(choices)
    is_valid(choices) ? SCORES[choices] : 0
  end

  def self.encrypted_score(choices)
    is_valid(choices) ? ENCRYPTED_SCORE[choices] : 0
  end

  private

  def self.is_valid(choices)
    choices.is_a?(String) && choices.length == 3
  end

end