class MatchesController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    # @matches = @league.matches
    @players = @league.users
    i = 0
    @matches = []
    matches_number = @players.size / 2

    matches_number.times do
      @matches << Match.create(league: @league, player1: @players[i], player2: @players[i + 1])
      i += 2
    end

    @matches
  end

  def new
    @match = Match.new
  end

  def create
    # @league = League.find(params[:league_id])
    @match = Match.new()
  end

  private

  def match_params
    params.require(:match).permit(:league_id)
  end
end
