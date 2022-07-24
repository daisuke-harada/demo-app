class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @notifications = current_user.passive_notifications
    # @notifications.where(checked: false).each do |notification|
    #   notification.update(checked: true)
    # end
  end

  def index
    @users = User.all
  end
end
