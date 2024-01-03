class DashboardController < ApplicationController
  before_action :authenticate!
  def index
    render json: jwt_payload
  end
end
