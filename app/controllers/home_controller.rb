class HomeController < ApplicationController
  before_action :ensure_current_user, only: [:index]

  def index
    @ranter = current_ranter
  end

  private

  def ensure_current_user
    redirect_to new_ranter_session_path unless current_ranter
  end
end
