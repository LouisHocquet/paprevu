class DiscoveriesController < ApplicationController

  def loader
    @activity = Activity.all.sample
  end

  def new
    @discovery = Discovery.new
    @activity = Activity.find(params[:activity_id])
    @discovery.activity = @activity
  end

  def create
    # break;
    @discovery = Discovery.new(discovery_params)
    @discovery.save
    redirect_to discovery_path(@discovery)
  end

  def show
    @discovery = Discovery.find(params[:id])
  end

  private

  def discovery_params
    params.require(:discovery).permit(:activity, :activity_id)
  end
end
