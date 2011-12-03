class Course < ActiveRecord::Base
  # Define o nome da tabela como 'courses'.
  set_table_name "courses"
  # Usa-se quando a chave primária não se chama 'id'.
  set_primary_key :course_id
  # Relações entre 'Models'.
  belongs_to :faculty
  has_many :discipline

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
