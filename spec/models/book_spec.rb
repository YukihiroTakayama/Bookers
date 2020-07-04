# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Validation' do
    let!(:user) { create(:user) }
    let!(:book) { build(:book, user_id: user.id) }

    subject { book.valid? }

    context 'バリデーションチェックの要件を満たす場合' do
      it { is_expected.to be_truthy }
    end
    describe 'title' do
      context '入力がない場合' do
        before { book.title = '' }

        it { is_expected.to be_falsey }
      end
    end
    describe 'body' do
      context '入力がない場合' do
        before { book.body = '' }

        it { is_expected.to be_falsey }
      end
      context '201文字以上の場合' do
        before { book.body = Faker::Lorem.characters(number: 201) }

        it { is_expected.to be_falsey }
      end
    end
    describe 'Association' do
      describe 'User' do
        it 'ユーザーに対して従属関係にあること' do
          expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to
        end
      end
    end
  end
end
