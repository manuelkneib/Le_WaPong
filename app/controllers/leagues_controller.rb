class LeaguesController < ApplicationController
  def index
    @leagues = League.joins(:user_leagues).where("user_leagues.user_id = #{current_user.id}")
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.creator = current_user
    @league.users << current_user
    raise
    if @league.save
      redirect_to leagues_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @league = League.find(params[:id])
  end

  def destroy
    @league.destroy

    redirect_to leagues_path, status: :see_other
  end

  def invitation
  end

  def join_league
  end

  private

  def league_params
    params.require(:league).permit(:name, :sport)
  end
end
