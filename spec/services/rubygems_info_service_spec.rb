require 'rails_helper'

RSpec.describe RubygemsInfoService, type: :model do
  describe '#call' do
    context 'with valid gem name' do
      it 'should return gem information' do
        gem_data = RubygemsInfoService.call('cucumber')

        expect(gem_data[:name]).to eq('cucumber')
      end
    end

    context 'with invalid gem name' do
      it 'should return false' do
        gem_data = RubygemsInfoService.call('')

        expect(gem_data).to eq(false)
      end
    end
  end
end