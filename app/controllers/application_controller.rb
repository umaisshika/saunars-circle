class ApplicationController < ActionController::Base
  protect_from_forgery :except => ["destroy"]
  before_action :configure_permitted_parameters, if: :devise_controller?

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
