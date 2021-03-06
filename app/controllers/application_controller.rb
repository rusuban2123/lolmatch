class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[teamname toprank_id jgrank_id midrank_id suprank_id botrank_id power_id detail starttime endtime weekday_id stime_id])
  end
end
