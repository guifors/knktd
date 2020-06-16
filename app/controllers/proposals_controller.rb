class ProposalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  def create
    @startup = Startup.new
  end
end
