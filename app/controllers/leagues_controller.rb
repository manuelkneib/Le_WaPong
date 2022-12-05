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
