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
      redirect_to league_path(params[:league_id])
    end
  end

  def destroy
    @user_league = UserLeague.find(params[:user_league_id])
    @user_league.destroy
  end
end
