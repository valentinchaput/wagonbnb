class ProfileController < ApplicationController
  def show
    @profile = current_user
  end
end
