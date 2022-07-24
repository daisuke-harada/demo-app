module UsersHelper
  def notifications_update(notifications)
    notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
