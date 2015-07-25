class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    require 'json'
    @user = User.new user_params
    if @user.valid && user.present?
      @user.save
      @data = File.read("/path/to/setup_form_typeform.json", "w")
      tempHash = JSON.parse(@data)
      personalize_webhook = "https://kids-board.herokuapp.com/users/" + @user.id + "/setup_forms"
      tempHash["webhook_submit_url"] = personalize_webhook

      generateTF = Faraday.new(:url => 'http://https://api.typeform.io') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      response = generateTF.post '/v0.3/forms', tempHash  # POST "name=maguro" to http://sushi.com/nigiri
      puts response.body

      # use faraday to do the post request and get the link
      # create a setup form
      # get the url from response
      # @user.setup_forms.create(form_url: url)
      redirect_to @user_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
