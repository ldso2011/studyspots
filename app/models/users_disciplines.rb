class UsersDisciplines < ActiveRecord::Base
  # Define o nome da tabela como 'users_disciplines'.
  set_table_name "users_disciplines"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :users_disciplines_id
  # Relações entre 'Models'.
  belongs_to :user
  belongs_to :discipline
  
  attr_accessible :faculty_id
end
