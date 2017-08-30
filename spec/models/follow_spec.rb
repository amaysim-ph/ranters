require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe '#follow!' do
    let(:ranter) { FactoryGirl.create(:ranter) }
    let(:followee) { FactoryGirl.create(:ranter) }

    subject { ranter.follow!(followee) }

    it 'make the ranter follow a followee' do
      subject

      expect(ranter.followees).to include(followee)
    end

    it 'makes the ranter a follower of followee' do
      subject

      expect(followee.followers).to include(ranter)
    end
  end
end


