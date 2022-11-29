class UserLeaguesController < ApplicationController
  def create
    UserLeague.create(league_id: params[:league_id], user: current_user)
    redirect_to leagues_path
  end
end
