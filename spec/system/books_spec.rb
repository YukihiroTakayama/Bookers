# frozen_string_literal: true

require 'rails_helper'

describe 'books' do
  let(:user) { create(:user) }
  let!(:sign_in) do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end

  describe '/create' do
    let(:book) { build(:book) }
    let(:book_title) { book.title }
    before do
      fill_in 'book[title]', with: book_title
      fill_in 'book[body]', with: book.body
      click_button 'Create Book'
    end

    context '投稿に成功' do
      it { expect(page).to have_content 'successfully' }
    end
    context '投稿に失敗' do
      let(:book_title) { nil }

      it do
        expect(page).to have_content 'error'
      end
    end
  end

  describe '/edit' do
    let!(:book) { create(:book, user_id: user.id) }
    let(:book_title) { book.title }

    before do
      visit edit_book_path(book.id)
      fill_in 'book[title]', with: book_title
      fill_in 'book[body]', with: book.body
      click_button 'Update Book'
    end

    context '編集に成功' do
      it { expect(page).to have_content 'successfully' }
    end
    context '編集に失敗' do
      let(:book_title) { nil }

      it { expect(page).to have_content 'error' } 
    end
  end
  describe 'デザイン要件の検証' do
    let!(:book) { create(:book, user_id: user.id) }

    describe '一覧画面' do
      it do
        visit books_path
        expect(page).to have_selector('.container .row .col-xs-3')
        expect(page).to have_selector('.container .row .col-xs-9')
      end
    end
    describe '詳細画面' do
      it do
        visit book_path(book.id)
        expect(page).to have_selector('.container .row .col-xs-3')
        expect(page).to have_selector('.container .row .col-xs-9')
      end
    end
  end
end
