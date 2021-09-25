class Tool < ApplicationRecord
  has_many :readme_tools
  has_many :readmes, through: :readme_tools

  validates_presence_of :name, :category
  validates_uniqueness_of :name, case_sensitive: false
end
