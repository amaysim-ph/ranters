class RantersController < ApplicationController
  def index
    @ranters = Ranter.all
  end

  def follow
    followee = Ranter.find_by(id: params[:id])
    follower = current_ranter

    follower.follow!(followee)

    redirect_to root_path
  end
end
