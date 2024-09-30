class FeedbackMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def send_feedback
    @message = params[:message]
    @user_email = params[:email]
    mail(from: @user_email, subject: 'New Feedback')
  end
end
