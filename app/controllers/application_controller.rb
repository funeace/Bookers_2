class ApplicationController < ActionController::Base

  #Refileを使うためのおまじない
  Refile.secret_key = '1ad283a8cb5235d383f91978f25d811a51c9c222ed704b32151a508ee58120a00697b30370866f496ee0f17244cb07fefc84dce88a83fa3da415175d601d709c'

  # ユーザー登録を行うときにemailとパスワード以外の項目をデータベースに登録する処理
  # ログインするときに名前を認証させる方法はdevise.rbを変更する必要がある
  # config.authentication_keys = [:email]において、[:email]のキーを変更することで実装できるみたい。条件が複数の場合は[:email,:name]のようにカンマ区切り
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  #ログイン後のリダイレクト先を明示的に変更する処理　pathを指定することで、変更できる
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end


end
