class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @challenge = Challenge.find(params[:id])
  end

  def companies
    @challenge = Challenge.find(params[:id])
  end
end
