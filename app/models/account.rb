class Account < ActiveRecord::Base

  # Uma conta tem um perfil.
  has_one :profile, :dependent => :destroy
  # Define o nome da tabela como 'accounts'.
  set_table_name "accounts"
  # Usa-se quando a chave primaria não se chama 'id'.
  set_primary_key :account_id
  # Campos acessiveis para o site.
  attr_accessible :email, :password, :password_confirmation
  # Campos protegidos contra alterações nos pedidos HTTP.
  attr_protected :account_level, :account_state
  # Antes de guardar a conta nova, encripta a password em MD5.
  before_save :encrypt_password
  # Validações
  validates_confirmation_of :password
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :allow_blank => false, :message => :email_format
  validates_uniqueness_of :username, :email
  validates_length_of :password, :within => 5..20, :allow_blank => false
  
  def self.authenticate(username, password)
    # Pesquisa uma conta pelo email (Ex. ei11001@fe.up.pt) ou pelo username (Ex. ei11001).
    account = (find_by_email(username) || find_by_username(username.split('@')[0]))
    # Se existir conta e a password da conta for igual ao parametro 'password'.
    if account && account.password == MD5.hexdigest(password)
      # Se verdade, retorna a conta.
      account
    else
      # Se falso, retorna null.
      nil
    end
  end

  def encrypt_password
    if password.present?
      # Gera o MD5 do password.
      self.password = Digest::MD5.hexdigest(password)
    end
  end

end