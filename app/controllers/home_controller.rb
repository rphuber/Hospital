class HomeController < ApplicationController
  def index
    @facilities = Facility.all
  end
end
