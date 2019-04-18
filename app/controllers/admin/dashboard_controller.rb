class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.admin[:user_key],
                               password: Rails.configuration.admin[:password_key]

  def show
  end
end
