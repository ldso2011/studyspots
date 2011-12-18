class WallSpots < ActiveRecord::Base
  # Define o nome da tabela como 'wall_spots'.
  set_table_name "wall_spots"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :wall_spots_id
  # Relações entre 'Models'.
  belongs_to :user
  belongs_to :spot
  attr_accessible :wall_spots_id, :spot_id, :user_id, :comment
end
