class Profile < ActiveRecord::Base

  # Pertence a uma 'Account'
  belongs_to :account
  # Define o nome da tabela como 'accounts'.
  set_table_name "profiles"
  # Usa-se quando a chave primaria não se chama 'id'.
  set_primary_key :account_id

end