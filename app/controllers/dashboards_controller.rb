class DashboardsController < ApplicationController
  def show
    @activities = current_user.activities.includes(:actor, :subject, :target).order(created_at: :desc)
  end
end
