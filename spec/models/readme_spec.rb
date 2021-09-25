require 'rails_helper'

describe Readme, type: :model do
  context 'validations' do
    it { should belong_to :user }

    describe "uniqueness" do
      subject { build(:readme) }
      it { should validate_uniqueness_of(:repository_url) }
    end
  end
end