class ApplicationController < ActionController::Base
  protect_from_forgery except: ['destroy']
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authority_login
    unless user_signed_in?
      flash[:danger] = 'ログイン後、操作してください'
      redirect_to new_user_session_path
    end
  end

  def check_owner
    unless @owner == current_user
      flash[:danger] = 'あなたが作成したデータではありません'
      redirect_to root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [
                                        :image,
                                        :name,
                                        :gender,
                                        :sauna_career,
                                        :home_sauna,
                                        :prefecture_id,
                                        :description,
                                        :profile
                                      ])
  end

  # 投稿6で次のページ
  PER = 6
end
