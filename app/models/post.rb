class Post < ApplicationRecord
  belongs_to :user
  has_many :notificaiton, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :content, presence: true

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save
  end
end
