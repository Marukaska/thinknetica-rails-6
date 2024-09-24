class FeedbackController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    message = params[:message]

    if email.present? && message.present?
      # Отправка письма администратору
      FeedbackMailer.with(email: email, message: message).send_feedback.deliver_now
      flash[:notice] = t('.success')
      redirect_to root_path
    else
      flash[:alert] = t('.error')
      render :new
    end
  end
end
