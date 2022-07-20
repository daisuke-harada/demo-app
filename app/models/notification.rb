class Notification < ApplicationRecord
  # デフォルトの並び順を「作成日時の降順」で指定
  # 常に新しい通知からデータを取得することができる
  # あるモデル全体にスコープを適用
  # scope :young, -> { where("age < 20") }
  default_scope -> { order(created_at: :desc) }
  belongs_to :post
  belongs_to :comment
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id'
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id'
end
