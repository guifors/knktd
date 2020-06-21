class ProposalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  def create
    @startup = Startup.new(startup_params)
    @proposal = Proposal.new(proposal_params)
    if @startup.save
      @proposal.startup_id = @startup.id
      @proposal.save!
      redirect_to confirm_two_pages_path
    else
      flash[:alert] = "Something went wrong."
      render :home
    end
  end

  private

  def startup_params
    params.require(:startup).permit(:employee_name, :employee_surname, :employee_email, :employee_job_title, :name, :privacy)
  end

  def proposal_params
    params.require(:proposal).permit(:usp, :poc_description, :poc_examples, :challenge_id)
  end
end
