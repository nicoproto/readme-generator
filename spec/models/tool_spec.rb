require 'rails_helper'

describe Tool, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :category }
    it { should validate_uniqueness_of(:name) }
  end
end