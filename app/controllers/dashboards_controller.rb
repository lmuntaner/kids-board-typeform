class DashboardsController < ApplicationController

  def index
  end

  def new
  end

  def create
    var user = User.find(params[:user_id])
    var answers = params[:answers]
    IntegrationRetriever.create_dashboard_integrations(answers)
  end
end
