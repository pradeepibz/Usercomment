class UserComment < ApplicationRecord

  after_create :check_time_interval

  scope :active, -> {where(is_active: true)}

  def comment_date_time
    created_at.strftime("%Y-%m-%d %H:%M")
  end

  def check_time_interval
    comments = UserComment.where("user_comments.created_at > ? AND user_comments.created_at < ?", created_at - 5.minutes, created_at)
    comments.update_all(is_active: false) if comments.present?
  end
end
