# app/controllers/flights_controller.rb
class FlightsController < ApplicationController
  before_action :set_flight, only: [:update_eta]

  def update_eta
    minutes_adjustment = params[:minutes].to_i

    if @flight.eta.present?
      new_eta = @flight.eta + minutes_adjustment.minutes
    else
      # Fallback to a default time if ETA is nil
      new_eta = Time.current.change(hour: 12, min: 10) + minutes_adjustment.minutes
    end

    if @flight.update(eta: new_eta)
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