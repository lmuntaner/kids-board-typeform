class DashboardIntegration < ActiveRecord::Base
  belongs_to :integration
  belongs_to :dashboards
end
