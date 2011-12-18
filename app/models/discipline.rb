class Discipline < ActiveRecord::Base
  # Define o nome da tabela como 'disciplines'.
  set_table_name "disciplines"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :discipline_id
  # Relações entre 'Models'.
  belongs_to :course
  has_many :spots
  has_one :walldiciplines
  #has_many :userdisciplines, :dependent => :delete_all
  has_many :users, :through => :userdisciplines
  has_many :walldisciplines, :dependent => :destroy
  attr_accessible :discipline_id, :code, :name, :acronym, :course_id, :semester, :year
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
