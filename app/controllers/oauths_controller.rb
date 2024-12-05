class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    status = auth_params[:status]
    Rails.logger.debug "#{status}"
    if @user = login_from(provider)
      redirect_to root_path, notice: "#{provider.titleize}でログインしました"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to root_path, notice: "#{provider.titleize}でログインしました"
      rescue
        # flash.now[:danger] = "#{provider.titleize}でログインできませんでした"
        # render :new, status: :unprocessable_entity
        redirect_to root_path, notice: "#{provider.titleize}でログインできませんでした"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :error, :state)
  end
end
