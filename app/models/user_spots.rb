class UserSpots < ActiveRecord::Base
  # Define o nome da tabela como 'users_spots'.
  set_table_name "user_spots"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :user_spots_id
  # Relações entre 'Models'.
  belongs_to :user
  belongs_to :spot
  #has_many :profiles, :through => :user
  validates_uniqueness_of :user_id
  attr_accessible :user_spots_id, :spot_id, :user_id
end
