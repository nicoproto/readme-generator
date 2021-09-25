class Readme < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :repository_url, case_sensitive: true
end
