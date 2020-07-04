# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    let(:user) { build(:user) }

    subject { user.valid? }

    context 'すべての要件を満たしている場合' do
      it { is_expected.to be_truthy }
    end

    describe 'name' do
      context '入力がない場合' do
        before { user.name = '' }

        it { is_expected.to be_falsey }
      end
      context '1文字以下の場合' do
        before { user.name = Faker::Lorem.characters(number: 1) }

        it { is_expected.to be_falsey }
      end
      context '21文字以上の場合' do
        before { user.name = Faker::Lorem.characters(number: 21) }

        it { is_expected.to be_falsey }
      end
    end

    context 'introduction' do
      context '51文字以上の場合' do
        before { user.introduction = Faker::Lorem.characters(number: 51) }

        it { is_expected.to be_falsey }
      end
    end
  end
  describe 'Association' do
    describe 'Book' do
      it '複数の所有者であること' do
        expect(described_class.reflect_on_association(:books).macro).to eq :has_many
      end
    end
  end
end
