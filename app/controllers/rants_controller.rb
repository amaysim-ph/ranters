class RantsController < ApplicationController
  def create
    current_ranter.rants.create rant_params

    redirect_to root_path
  end

  private

  def rant_params
    params.require(:rant).permit(:message, :photo)
  end
end
