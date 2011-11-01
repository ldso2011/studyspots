class ApplicationController < ActionController::Base

  # Activa a proteção de falsificação de solicitação.
  protect_from_forgery

  # Antes de executar define a linguagem (Também pode ser utilizado para permissões).
  before_filter :set_locale

  # Define a linguagem do site.
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale || I18n.locale = extract_locale_from_accept_language_header
  end

  # Extrai a linguagem do browser utilizado.
  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  # Linguagem por defeito do site.
  private
  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  # Permite aceder ao controlador das 'accounts'.
  helper_method :current_account

end