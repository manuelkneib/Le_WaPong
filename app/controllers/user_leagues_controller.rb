class UserLeaguesController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    if !current_user
      session[:attendee] = true
      redirect_to user_session_path
    else
      UserLeague.create(league_id: params[:league_id], user: current_user, points: 0)
      redirect_to league_path(params[:league_id])
    end
  end
end
