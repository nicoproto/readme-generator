require 'rails_helper'

describe Readme, type: :model do
  context 'validations' do
    it { should belong_to :user }
    it { should have_many :readme_tools }
    it { should have_many :tools }

    describe "uniqueness" do
      subject { build(:readme) }
      it { should validate_uniqueness_of(:repository_url).case_insensitive }
    end
  end
end