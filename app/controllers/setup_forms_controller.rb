class SetupFormsController < ApplicationController
  def show
    @lastsetupform = current_user.setup_forms.last
    render json: @lastsetupform
  end
end
