# frozen_string_literal: true

require 'rails_helper'

describe 'users' do
  let(:user) { create(:user) }
  let(:sign_in) do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end

  describe '/sign_up' do
    let!(:user) { build(:user) }
    let(:user_name) { user.name }

    before do
      visit new_user_registration_path
      fill_in 'user[name]', with: user_name
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      fill_in 'user[password_confirmation]', with: user.password_confirmation
      click_button 'Sign up'
    end

    context '登録に成功' do
      it '「successfully」という文言のメッセージが表示されること' do
        expect(page).to have_content 'successfully'
      end
    end
    context '登録に失敗' do
      let(:user_name) { '' }

      it '「error」という文言が含まれているメッセージが表示されていること' do
        expect(page).to have_content 'error'
      end
    end
  end
  describe '/sign_in' do
    let(:user_name) { nil }
    let(:password) { nil }

    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user_name
      fill_in 'user[password]', with: password
      click_button 'Log in'
    end

    context 'ログインに成功' do
      let(:user_name) { user.name }
      let(:password) { user.password }

      it '「successfully」という文言のメッセージが表示され' do
        expect(page).to have_content 'successfully'
      end
    end
    context 'ログインに失敗' do
      it '遷移されていないこと' do
        expect(current_path).to eq new_user_session_path
      end
    end
  end
  describe '/edit' do
    let(:user_name) { user.name }

    before do
      sign_in
      visit edit_user_path(user.id)
      fill_in 'user[name]', with: user_name
      click_button 'Update User'
    end

    context '編集に成功' do
      it 'ログインユーザーの詳細画面に遷移しており、「successfully」という文言のメッセージが表示されていること' do
        expect(current_path).to eq('/users/' + user.id.to_s)
        expect(page).to have_content 'successfully'
      end
      context '編集に失敗' do
        let(:user_name) { nil }

        it do
          expect(current_path).to eq('/users/' + user.id.to_s)
          expect(page).to have_content 'error'
        end
      end
    end
  end
  describe '/users' do
    describe 'デザイン要件の検証' do
      it do
        sign_in
        visit users_path
        expect(page).to have_selector('.container .row .col-xs-3')
        expect(page).to have_selector('.container .row .col-xs-9')
      end
    end
  end
  describe '/users' do
    describe 'デザイン要件の検証' do
      it do
        sign_in
        visit user_path(user)
        expect(page).to have_selector('.container .row .col-xs-3')
        expect(page).to have_selector('.container .row .col-xs-9')
      end
    end
  end
end
