class DashboardsController < ApplicationController
  CATEGORY_DICT = {
    0 => "Music",
    1 => "Cartoons",
    2 => "Games",
    5 => "Comic",
    6 => "Learning"
  }

  def index
    @dashboard = current_user.dashboards.last
    current_user.selected_integrations.create(dashboard_id: @dashboard.id)
  end

  def new
  end

  def create
    user = User.find(params[:user_id])
    dashboard = user.dashboards.new
    dashboard.save
    answers = params[:answers]
    answers.each_with_index do |answer, index|
      next if index == 3 || index == 4
      name = answer["data"]["value"]["label"]
      label = CATEGORY_DICT[index]
      integration = Integration.find_by(name: name)
      dashboard.dashboard_integrations.create(integration_id: integration.id, label: label)
    end
    data = File.read("#{Rails.root}/app/services/dashboard_form.json")
    tempHash = JSON.parse(data)
    # personalize_webhook = "https://kids-board.herokuapp.com/users/#{user.id}/integrations"
    personalize_webhook = "http://20bbdb89.ngrok.com/users/#{user.id}/selected_integrations"
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

    dashboard.dashboard_url = JSON.parse(response.body)["links"][1]["href"]
    dashboard.save

    redirect_to root_path
  end
end
