class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :setup_forms
  has_many :dashboards
  has_many :selected_integrations
end
