class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :name, :house_id
end
