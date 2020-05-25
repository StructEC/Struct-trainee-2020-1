class Author < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :books
end
