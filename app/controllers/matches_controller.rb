class MatchesController < ApplicationController
  def index
    @league = League.find(params[:league_id])

    @players = @league.users

    set_league_matches

    @matches = Match.where(league: @league)
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

  def set_league_matches
    Match.where(league: @league).destroy_all

    num_rounds = @players.size - 1
    num_matches = (1..@players.size).inject(:*) / (2 * (1..(@players.size - 2)).inject(:*))

    unless num_matches.fdiv(num_rounds) == num_matches.fdiv(num_rounds).round
      @max_round = num_rounds + 1
    else
      @max_round = num_rounds
    end

    round_num = 1
    @players.each do |player|
      adversaries = @players.where.not(id: player.id)
      adversaries.each do |adversary|
        if Match.where(league: @league).present?
          if Match.where(league: @league).last.round == round_num
            if round_num < @max_round
              round_num += 1
            else
              round_num = 1
            end
          end
        end
        if Match.where(player1: player, player2: adversary, league: @league).empty? && Match.where(player1: adversary, player2: player, league: @league).empty?
          while Match.where("matches.player1_id= #{player.id} OR matches.player2_id = #{player.id} OR matches.player1_id= #{adversary.id} OR matches.player2_id = #{adversary.id}").where(round: round_num, league: @league).present?
            if round_num < @max_round
              round_num += 1
            else
              round_num = 1
            end
          end

          match = Match.new(player1: player, player2: adversary, round: round_num)
          match.league = @league
          match.save
        end
      end
    end
  end
end