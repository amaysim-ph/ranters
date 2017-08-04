class RantsController < ApplicationController
  def create
    Rant.create rant_params

    redirect_to root_path
  end

  private

  def rant_params
    params.require(:rant).permit(:ranter_id, :message)
  end
end
