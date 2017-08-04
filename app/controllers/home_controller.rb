class HomeController < ApplicationController
  def index
    @ranter = current_ranter
  end
end
