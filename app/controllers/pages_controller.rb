class PagesController < ApplicationController
  def home
    @nb_activities = Activity.count
  end
end
