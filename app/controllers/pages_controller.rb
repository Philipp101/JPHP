class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]
  def home
    @events = Event.all
  end

  def contact
  end
end
