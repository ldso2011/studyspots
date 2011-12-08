class Faculty < ActiveRecord::Base
  # Define o nome da tabela como 'faculties'.
  set_table_name "faculties"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :faculty_id
  # Relações entre 'Models'.
  has_many :course
  
  attr_accessible :faculty_id, :name, :acronym, :faculty_type, :url
  
  validates_uniqueness_of :name, :acronym
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
