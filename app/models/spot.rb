class Spot < ActiveRecord::Base
   # Define o nome da tabela como 'spots'.
  set_table_name "spots"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :spot_id
  # Relações entre 'Models'.
  belongs_to :user
  belongs_to :discipline
  
  attr_accessible :spot_id, :discipline_id, :user_id, :name, :local
end
