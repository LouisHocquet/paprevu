class PagesController < ApplicationController
  def home
    @nb_activities = Activity.count
  end

  def map_sandbox

  end
end
