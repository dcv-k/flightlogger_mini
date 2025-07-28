class FlightsController < ApplicationController
  before_action :set_flight, only: [:update_eta]
  def update_eta
    service = FlightEtaUpdater.new(@flight, params[:minutes].to_i)

    if service.call
      respond_to do |format|
        format.turbo_stream { render 'flights/update_eta' }
        format.html { redirect_back(fallback_location: root_path) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("side-panel-eta", partial: "shared/error") }
        format.html { redirect_back(fallback_location: root_path, alert: "Error updating ETA") }
      end
    end
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end
end