require 'rails_helper'

describe ReadmeTool, type: :model do
  context 'validations' do
    it { should belong_to :readme }
    it { should belong_to :tool }

    # describe "uniqueness" do
    #   subject { build(:readme) }
    #   it { should validate_uniqueness_of(:repository_url).case_insensitive }
    # end
  end
end