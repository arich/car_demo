class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordInvalid, with: :bad_request

  protected

  def bad_request
    head :bad_request
  end
end
