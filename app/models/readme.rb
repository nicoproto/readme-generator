class Readme < ApplicationRecord
  belongs_to :user
  has_many :readme_tools
  has_many :tools, through: :readme_tools

  validates_uniqueness_of :repository_url, case_sensitive: false
end
