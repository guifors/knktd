class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:companies, :create]

  def create
    @corporate = Corporate.new(corporate_params)
    @challenge = Challenge.new(challenge_params)
    if @corporate.save
      @challenge.corporate_id = @corporate.id
      @user = User.invite!(email: params[:corporate][:email])
      @challenge.user = @user
      @challenge.save!
      redirect_to confirm_pages_path
    else
      flash[:alert] = "Something went wrong."
      render :home
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def companies
    @challenge = Challenge.find(params[:id])
  end

  private

  def corporate_params
    params.require(:corporate).permit(:name, :surname, :email, :job_title, :company_name, :company_industry)
  end

  def challenge_params
    params.require(:challenges).permit(:region, :description, :search_criteria)
  end
end
