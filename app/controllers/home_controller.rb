class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:user_profile]
  def home
  end
  def user_profile
  end
end
