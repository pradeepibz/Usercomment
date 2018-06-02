class DashboardController < ApplicationController
  def index
    @user_comment = UserComment.new
    @comments = UserComment.active.order("created_at DESC")
  end
end
