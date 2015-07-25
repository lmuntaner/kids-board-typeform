class SelectedIntegration < ActiveRecord::Base
  belongs_to :user
  belongs_to :dashboard
end
