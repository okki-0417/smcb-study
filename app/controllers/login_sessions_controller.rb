# frozen_string_literal: true

class LoginSessionsController < ApplicationController
  def new
  end

  def create
    @form = LoginForm.new(login_params)
    return render :new if @form.invalid?

    user = User.find_by(email: @form.email)
    if user && user.authenticate(@form.password)
      login(user)
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = "emailまたはpasswordが正しくありません"
      render :new
    end
  end

  def destroy
    return render :new unless logged_in?
    logout
    redirect_to root_path
  end

  private
  def login_params
    params.require(:login_form).permit(:email, :password)
  end
end
