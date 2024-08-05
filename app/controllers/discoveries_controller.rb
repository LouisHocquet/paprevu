class DiscoveriesController < ApplicationController
  # def new
  #   @discovery = Discovery.new
  #   @discovery.activity = get_random_activity
  # end

  def random_discovery
    @discovery = Discovery.new
    @discovery.activity = get_random_activity
    @discovery.save
    redirect_to discovery_path(@discovery)
  end

  def show
    @discovery = Discovery.find(params[:id])
  end

  # def create
  #   break;
  #   @discovery = Discovery.new(discovery_params)
  #   @discovery.save
  #   redirect_to discovery_path(@discovery)
  # end

  private

  def get_random_activity
    Activity.all.sample
  end

  def discovery_params
    params.require(:discovery).permit(:activity, :activity_id)
  end
end
