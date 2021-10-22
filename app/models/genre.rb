class Genre < ApplicationRecord
  has_many :films, dependent: :nullify
end
