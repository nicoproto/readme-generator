class Tool < ApplicationRecord
  validates_presence_of :name, :category

  validates_uniqueness_of :name, case_sensitive: true
end
