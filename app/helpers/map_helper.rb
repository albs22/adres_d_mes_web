module MapHelper

  def google_maps_api_key
    ENV['MAPS_API_KEY']
  end

  def google_api_url
    "https://maps.googleapis.com/maps/api/js"
  end

  def default_lat
    32.2460
  end

  def default_lng
    -110.9596
  end

  def google_api_access
     "#{google_api_url}?key=#{google_maps_api_key}&libraries=geometry&sensor=false"
  end

  def google_maps_api
    content_tag(:script,:type => "text/javascript",:src => google_api_access) do
        end
  end



end
