# app/services/flight_eta_updater.rb
class FlightEtaUpdater
  def initialize(flight, minutes_adjustment)
    @flight = flight
    @minutes_adjustment = minutes_adjustment
  end

  def call
    new_eta = if @flight.eta.present?
                @flight.eta + @minutes_adjustment.minutes
              else
                Time.current.change(hour: 12, min: 10) + @minutes_adjustment.minutes
              end

    @flight.update(eta: new_eta)
  end
end
