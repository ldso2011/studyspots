class Spot < ActiveRecord::Base
  
  # Define o nome da tabela como 'accounts'.
  set_table_name "spots"
  # Usa-se quando a chave primaria não se chama 'id'.
  set_primary_key :spot_id
  # Campos acessiveis para o site.
  attr_accessible :local, :start_time, :end_time, :owner_id
  # Campos protegidos contra alterações nos pedidos HTTP.
  #attr_protected :owner_id
  # Validações
  validates_length_of :local, :within => 3..50, :allow_blank => false
  
  def self.owner()
    profile = Profile.find_by_account_id(owner_id)
    if profile
      profile.first_name + ' ' + profile.last_name
    else
      nil
    end
  end

end