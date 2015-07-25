require 'json'

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.valid?
      @user.save
      data = File.read("#{Rails.root}/app/services/setup_form.json")
      tempHash = JSON.parse(data)
      personalize_webhook = "https://kids-board.herokuapp.com/users/#{@user.id}/setup_forms"
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

      # use faraday to do the post request and get the link
      # create a setup form
      # get the url from response
      # @user.setup_forms.create(form_url: url)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
