class WallDisciplines < ActiveRecord::Base
  # Define o nome da tabela como 'wall_disciplines'.
  set_table_name "wall_disciplines"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :wall_disciplines_id
  # Relações entre 'Models'.
  belongs_to :user
  belongs_to :discipline
  attr_accessible :wall_disciplines_id, :discipline_id, :user_id, :comment
end
