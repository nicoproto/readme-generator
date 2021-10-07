class Readme < ApplicationRecord
  attr_accessor :gem_names
  attr_accessor :package_names

  belongs_to :user
  has_many :readme_tools, dependent: :destroy
  has_many :tools, through: :readme_tools
  has_one_attached :banner
  has_one_attached :db_schema

  has_rich_text :project_description
  has_rich_text :contribution_steps
  has_rich_text :prerequisites

  validates_uniqueness_of :repository_url, case_sensitive: false
end
