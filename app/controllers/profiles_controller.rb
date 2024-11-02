class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: "登録情報を更新しました"
    else
      flash.now['danger'] = "登録情報を更新できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :gender, :age_group, :password, :password_confirmation)
  end
end
