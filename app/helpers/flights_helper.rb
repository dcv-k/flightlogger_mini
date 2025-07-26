module FlightsHelper
  def progress_class(progress)
    case progress
    when 0..39
      'progress-low'
    when 40..69
      'progress-medium'
    else
      'progress-high'
    end
  end

  def format_flight_time(time_string)
    # Add any time formatting logic here
    time_string
  end

  def status_indicator(status)
    case status
    when 'active'
      content_tag :span, class: 'status-icon status-active' do
      end
    when 'pending'
      content_tag :span, class: 'status-icon status-pending' do
      end
    when 'completed'
      content_tag :span, class: 'status-icon status-completed' do
      end
    end
  end
end
