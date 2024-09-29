class DiariesController < ApplicationController
  before_action :restrict_to_login_user, only: [ :new, :create ]
  def index
    @diaries = Diary.all
  end

  def new
  end

  def create
    new_diary_params = {
      creator_user_id: current_user.id,
      **diary_params
    }
    @diary = current_user.diaries.new(new_diary_params)
    if @diary.save
      redirect_to diary_path(@diary), notice: "日記を作成しました"
    else
      render :new
    end
  end

  def diary_params
    params.require(:diary).permit(:title, :okazu_title, :reputation_points, :content)
  end
end
