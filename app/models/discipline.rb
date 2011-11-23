class Discipline < ActiveRecord::Base
  # Define o nome da tabela como 'disciplines'.
  set_table_name "disciplines"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :discipline_id
  
  belongs_to :course
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
