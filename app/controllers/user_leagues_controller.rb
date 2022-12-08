class UserLeaguesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @league = League.find(params[:league_id])
    if !current_user
      session[:attendee] = true
      redirect_to user_session_path
    elsif @league.matches.present?
      redirect_to leagues_path, notice: "Too late... the league has already started :/"
    else
      UserLeague.create(league_id: params[:league_id], user: current_user, points: 0)
      redirect_to league_path(params[:league_id]), notice: "Welcome to the league!"
    end
  end

  def destroy
    @league = League.find(params[:id])
    @user_league = UserLeague.find_by(league_id: params[:id], user_id: params[:player_id])
    @user_league.destroy
    redirect_to league_path(@league), status: :see_other
  end
end
