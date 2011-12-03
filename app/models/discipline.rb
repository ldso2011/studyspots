class Discipline < ActiveRecord::Base
  # Define o nome da tabela como 'disciplines'.
  set_table_name "disciplines"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :discipline_id
  # Relações entre 'Models'.
  belongs_to :course
  has_many :users
  has_many :users, :through => :usersdisciplines

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
