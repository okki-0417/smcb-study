# frozen_string_literal: true

class LoginSessionsController < ApplicationController
  def new
    @form = LoginForm.new
  end

  def create
    @form = LoginForm.new(login_params)
    return render :new if @form.invalid?

    user = User.find_by(email: @form.email)
    if user && user.authenticate(@form.password)
      login(user)
      redirect_to mypage_path, notice: "ログインしました"
    else
      render :new
    end
  end

  def destroy
    return render :new unless logged_in?
    logout
    redirect_to root_path, notice: "ログアウトしました"
  end

  private
  def login_params
    params.require(:login_form).permit(:email, :password)
  end
end
