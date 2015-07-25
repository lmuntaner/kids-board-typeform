class Dashboard < ActiveRecord::Base
  belongs_to :user
  has_many :dashboard_integrations
  has_many :selected_integrations
  has_many :email_integrations
end
