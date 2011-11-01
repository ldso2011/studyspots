class AccountSpot < ActiveRecord::Base
  
  # Define o nome da tabela como 'accounts_spots'.
  set_table_name "accounts_spots"
  # Usa-se quando a chave primaria não se chama 'id'.
  set_primary_key :id
  # Campos acessiveis para o site.
  attr_accessible :id, :account_id, :spot_id
  
end