class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :update]

  def new
    @search = Search.new
    @event_brands = EventBrand.order(:name)
    @events = Event.joins(:event_market).order('event_markets.name')
  end

  def create
    search_params['event_brand_id'].delete('') if search_params.has_key?('event_brand_id')
    search_params['location_id'].delete('')    if search_params.has_key?('location_id')

    @search = Search.create!(search_params)

    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def update
    @search.update!(search_params)

    respond_to do |format|
      format.js
    end
  end

  private

  def search_params
    params.require(:search).permit!
  end

  def set_search
    @search = Search.find(params[:id])
  end
end
