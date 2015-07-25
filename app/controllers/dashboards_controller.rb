class DashboardsController < ApplicationController

  def new
  end

  def show
    @dashboard = current_user.dashboards.first
  end

  def create
    user = User.find(params[:user_id])
    dashboard = user.dashboard.new
    dashboard.save
    answers = params[:answers]
    IntegrationRetriever.create_dashboard_integrations(dashboard, answers)
    data = File.read("#{Rails.root}/app/services/dashboard_form.json")
    tempHash = JSON.parse(data)
    personalize_webhook = "https://kids-board.herokuapp.com/users/#{user.id}/integrations"
    tempHash["webhook_submit_url"] = personalize_webhook

    generateTF = Faraday.new(:url => 'https://api.typeform.io') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = generateTF.post do |req|
      req.url '/v0.3/forms'
      req.headers["X-API-TOKEN"] = '487dd5b20dbd7f641fd79edbb77915ef'
      req.body = tempHash.to_json
    end

    redirect_to root_path
  end
end
