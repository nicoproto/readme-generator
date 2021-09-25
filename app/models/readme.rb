class Readme < ApplicationRecord
  belongs_to :user
  has_many :readme_tools
  has_many :tools, through: :readme_tools
  has_rich_text :project_description

  validates_uniqueness_of :repository_url, case_sensitive: false
end
