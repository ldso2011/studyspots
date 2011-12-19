class ApplicationController < ActionController::Base
  # Inclui todos os 'Helpers'.
  helper :all
  # Esconde as passwords nos 'logs'.
  config.filter_parameters 'password'
  # Activa a proteção de falsificação de solicitação.
  protect_from_forgery :secret => '78c0ab0fdb009a67d6b0ca5add7739cc'
  # Antes de executar define a linguagem (Também pode ser utilizado para permissões).
  before_filter :set_locale, :prepare_for_mobile
  # Define a linguagem do site.
  def set_locale
    if(user_signed_in?)
      if Profile.find_by_user_id(current_user.id) == nil
        I18n.locale = I18n.default_locale
      else
        I18n.locale = Profile.find_by_user_id(current_user.id).language
      end
    else
      I18n.locale = params[:locale] || I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
    end
  end
  # Extrai a linguagem do browser utilizado.
  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
  # Linguagem por defeito do site.
  def default_url_options(options={})
    { :locale => I18n.locale }
  end
  
  private
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
end
