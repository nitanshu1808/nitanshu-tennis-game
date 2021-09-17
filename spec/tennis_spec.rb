require './../tennis'

describe Tennis do

  describe '#result?' do
    it "returns false if invalid score" do
      score = { player_one: 3, player_two: 3 } #deuce
      expect(Tennis.new(score).send(:result?)).to eql(false)
      score = { player_one: 3, player_two: 1 }
      expect(Tennis.new(score).send(:result?)).to eql(false)
    end

    it "returns true if there is a 2 points difference and one player has total points greater > 4" do
      score = { player_one: 4, player_two: 2 }
      expect(Tennis.new(score).send(:result?)).to eql(true)
      score = { player_one: 1, player_two: 4 }
      expect(Tennis.new(score).send(:result?)).to eql(true)
    end
  end

  describe '#neutralise_advantage' do
    it "reduces points by 1 for both players" do
      score = { player_one: 3, player_two: 3 }
      expect(Tennis.new(score).send(:neutralise_advantage)).to eql({ player_one: 2, player_two: 2 })
    end
  end

  describe '#leader' do
    it "returns the leading scorer" do
      score = { player_one: 2, player_two: 3 }
      expect(Tennis.new(score).send(:leader)).to eql(:player_two)
    end
  end

  describe '#trailer' do
    it "returns the loosing player" do
      score = { player_one: 2, player_two: 3 }
      expect(Tennis.new(score).send(:trailer)).to eql(:player_one)
    end
  end

  describe '#scores_equal?' do
    it "returns the true if scores are equal" do
      score = { player_one: 3, player_two: 3 }
      expect(Tennis.new(score).send(:scores_equal?, 3)).to eql(true)
      score = { player_one: 4, player_two: 4 } #neutralising advantage
      expect(Tennis.new(score).send(:scores_equal?, 4)).to eql(true)
    end
  end

  describe '#start' do
    it "verifies the end result" do
      game = Tennis.new
      game.start
      expect(game.send(:result?)).to eql(true)
      expect(game.score.max_by{|k,v| v}[0]).to eql(game.send(:leader))
    end
  end
end
