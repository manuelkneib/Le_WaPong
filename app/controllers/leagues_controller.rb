class LeaguesController < ApplicationController
  skip_before_action :authenticate_user!, only: :invitation
  before_action :set_league, only: %i[show invitation join-league destroy set_points]
  def index
    @leagues = League.joins(:user_leagues).where("user_leagues.user_id = #{current_user.id}")
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.creator = current_user
    if @league.save
      redirect_to league_path(@league)
    else
      render :new, status: :unprocessable_entity
    end
    UserLeague.create(league: @league, user: current_user, points: 0)
  end

  def show
    @league = League.find(params[:id])
    set_points
    @qr_code = RQRCode::QRCode.new(invitation_url(@league))
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 6
    )
    @leaderboard_players = User.joins(:user_leagues).where("user_leagues.league_id = #{@league.id}")
  end

  def destroy
    @league.destroy
    redirect_to leagues_path, status: :see_other
  end

  def invitation
    session[:previous_url] = request.fullpath
    @league = League.find(params[:id])
  end

  def setmatches
    @league = League.find(params[:id])
    @players = @league.users

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
    redirect_to league_matches_path(@league)
  end

  private

  def league_params
    params.require(:league).permit(:name, :sport)
  end

  def set_league
    @league = League.find(params[:id])
  end

  def set_points
    @players = @league.user_leagues
    @players.each do |player|
      @wins = @league.matches.where("winner_id = #{player.user_id}").count
      points = @wins * 3
      player.points = points
      player.save
    end
    @wins
  end
end
