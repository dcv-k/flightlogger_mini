# app/helpers/application_helper.rb
module ApplicationHelper
  def calculate_progress(flight)
    eta = get_adjusted_eta(flight)
    current_time = Time.current
    remaining_time = eta - current_time
    max_time_window = 2.hours

    if remaining_time <= 0
      100
    elsif remaining_time >= max_time_window
      0
    else
      ((max_time_window - remaining_time) / max_time_window * 100).round(1)
    end
  end

  def calculate_time_left(flight)
    eta = get_adjusted_eta(flight)
    remaining_time = eta - Time.current

    if remaining_time <= 0
      "Arrived"
    else
      hours = (remaining_time / 3600).to_i
      minutes = ((remaining_time % 3600) / 60).to_i

      if hours > 0
        "#{hours}h #{minutes}m left"
      else
        "#{minutes}m left"
      end
    end
  end

  private

  def get_adjusted_eta(flight)
    eta = flight.eta || 2.hours.from_now
    eta = 2.hours.from_now if eta <= Time.current
    eta
  end
end