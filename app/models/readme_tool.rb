class ReadmeTool < ApplicationRecord
  belongs_to :readme
  belongs_to :tool

  validates :tool, uniqueness: { scope: :readme }
end
