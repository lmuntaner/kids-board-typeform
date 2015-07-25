class SelectedIntegrationsController < ApplicationController

  def selection_created
    selected_integration_created = current_user.selected_integrations.last.label.present?
    if selected_integration_created
      label = current_user.selected_integrations.last.label
      dashboard = current_user.dashboards.last
      dashboard_integration = dashboard.dashboard_integrations.where(label: label).last
      redirect_url = dashboard_integration.integration.integration_url
      render json: {
        created: true,
        redirect_url: redirect_url
      }
    else
      render json: {created: false}
    end
  end

  def create
    user = User.find(params[:user_id])
    selected_integration = user.selected_integrations.last
    label = params["answers"][0]["data"]["value"]["label"]
    selected_integration.label = label
    selected_integration.save
    render json: {thanks: true}
  end
end
