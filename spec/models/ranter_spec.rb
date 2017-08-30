require 'rails_helper'

RSpec.describe Ranter, type: :model do
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

  describe '#followable?' do
    let(:ranter) { FactoryGirl.create(:ranter) }

    subject { ranter.followable?(follower) }

    context 'given the ranter and follower is the same' do
      let(:follower) { ranter }

      it { is_expected.to be_falsy }
    end

    context 'given the ranter is already being followed by the follower' do
      let(:follower) { FactoryGirl.create(:ranter) }

      before do
        follower.follow!(ranter)
      end

      it { is_expected.to be_falsy }
    end

    context 'given the ranter is not being followed by the follower' do
      let(:follower) { FactoryGirl.create(:ranter) }

      it { is_expected.to be_truthy }
    end
  end
end
