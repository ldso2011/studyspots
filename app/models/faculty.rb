class Faculty < ActiveRecord::Base
  # Define o nome da tabela como 'faculties'.
  set_table_name "faculties"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :faculty_id
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
