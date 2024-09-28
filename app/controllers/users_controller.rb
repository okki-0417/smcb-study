# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :reject_logged_in_user, only: %i[new create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to mypage_path, notice: "新規ユーザーを作成しました"
    else
      render :new
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def reject_logged_in_user
    redirect_to mypage_path, notice: "既にログインしています" if logged_in?
  end
end
