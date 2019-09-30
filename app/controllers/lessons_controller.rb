class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section

  def require_authorized_for_current_section
    if current_user.enrolled_in? presence: true
      else render plain: "Unauthorized", status: :unauthorized
          redirect_to course_path(current_lesson.section.course), alert: 'Not currently enrolled in lesson'
  end
    
  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
end