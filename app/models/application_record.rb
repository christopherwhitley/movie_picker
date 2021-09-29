class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  serialize :film_id, Array

end
