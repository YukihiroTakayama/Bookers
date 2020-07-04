# frozen_string_literal: true

require 'rails_helper'

describe 'header' do
  describe 'ヘッダーデザインの検証' do
    context '未ログイン' do
      before do
        visit root_path
      end
      it do
        expect(page).to have_content 'Bookers'
        expect(page).to have_content 'Home'
        expect(page).to have_content 'About'
        expect(page).to have_content 'sign up'
        expect(page).to have_content 'login'
      end
    end
    describe 'ログイン済' do
      let(:user) { create(:user) }
      before do
        visit new_user_session_path
        fill_in 'user[name]', with: user.name
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end
      it do
        expect(page).to have_content 'Bookers'
        expect(page).to have_content 'Home'
        expect(page).to have_content 'Users'
        expect(page).to have_content 'Books'
        expect(page).to have_content 'logout'
      end
    end
  end
end
