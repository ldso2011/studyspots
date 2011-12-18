class UserDisciplines < ActiveRecord::Base
  # Define o nome da tabela como 'users_disciplines'.
  set_table_name "user_disciplines"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :user_disciplines_id
  # Relações entre 'Models'.
  belongs_to :user
  belongs_to :discipline
  validates_uniqueness_of :user_id, :scope => :discipline_id
  attr_accessible :user_disciplines_id, :discipline_id, :user_id, :comment
end
