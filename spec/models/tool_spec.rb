require 'rails_helper'

describe Tool, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :category }
    it { should validate_uniqueness_of(:name).case_insensitive }

    it { should have_many :readme_tools }
    it { should have_many :readmes }
  end
end