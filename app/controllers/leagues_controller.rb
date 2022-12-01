class LeaguesController < ApplicationController
  before_action :set_league, only: %i[show invitation join-league destroy]
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
      redirect_to leagues_path
    else
      render :new, status: :unprocessable_entity
    end

    UserLeague.create(league: @league, user: current_user, points: 0)
  end

  def show
    @league = League.find(params[:id])
  end

  def destroy
    @league.destroy

    redirect_to leagues_path, status: :see_other
  end

  def invitation
    @league = League.find(params[:id])
  end


  private

  def league_params
    params.require(:league).permit(:name, :sport)
  end

  def set_league
    @league = League.find(params[:id])
  end
end
