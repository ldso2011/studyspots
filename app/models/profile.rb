class Profile < ActiveRecord::Base
  # Define o nome da tabela como 'profiles'.
  set_table_name "profiles"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :profile_id
  # Relações entre 'Models'.
  belongs_to :user
  belongs_to :faculty
  belongs_to :course
  
  validate :year, :presence => true
  attr_accessible :first_name, :last_name, :course_id, :faculty_id, :language, :year, :latitude, :longitude, :local, :spot_id
end
