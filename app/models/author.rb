class Author < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :books, dependent: :destroy

  has_one_attached :photo

  # Lista de comandos úteis
  # Criação
  # Author.create(name: 'Nome', year: 2020, email: 'e-mail')
  #
  # Update
  # Author.update(name: 'Nome', year: 2020, email: 'e-mail')
  #
  # Query Method
  # Author.all (retorna uma lista)
  # Author.where(name: 'Nome', year: 2020) (retorna uma lista)
  # Author.find_by(name: 'Nome') (retorna um objeto)
  # Author.find(id) (retorna um objeto)
  # object.books
  #
  # Deleção
  # OBS: Lembrar do :dependent destroy no has_many
  # object.destroy
end
