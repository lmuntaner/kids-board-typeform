class IntegrationRetriever
  CATEGORY_DICT = {
    1 => "Music",
    2 => "Cartoons",
    3 => "Games",
    6 => "Comic",
    7 => "Learning"
  }

  def self.create_dashboard_integrations(dashboard, answers)
    answers.each do |answer|
      field_number = answer["field_id"]
      value = answer["data"]["value"]["label"]
      integration_link = Integration.where(field_number: field_number, value: value).first.link
      dashboard.dashboard_integration.create(integration_url: integration_link)
    end
  end
end
