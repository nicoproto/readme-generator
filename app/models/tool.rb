class Tool < ApplicationRecord
  has_many :readme_tools, dependent: :destroy
  has_many :readmes, through: :readme_tools

  validates_presence_of :name # TODO: Add category
  validates_uniqueness_of :name, case_sensitive: false

  before_create :fetch_tool_data

  scope :gems, -> { where(category: 'gem')}
  scope :packages, -> { where(category: 'package')}

  def fetch_tool_data
    tool_data = RubygemsInfoService.call(name).first
    self.name = tool_data[:name]
    self.version = tool_data[:version]
    self.description = tool_data[:description]
    self.repository_url = tool_data[:repository_url]
    self.website_url = tool_data[:website_url]
  end
end
