module ApplicationHelper

  # Atribui o objecto 'Account' na variavel se existir uma sessão com o 'account_id'.
  def current_account
    # "||=" -> Significa que é atribuido um valor a @current_account, a não ser que já possua um valor.
    @current_account ||= Account.find(session[:account_id]) if session[:account_id]
  end

end