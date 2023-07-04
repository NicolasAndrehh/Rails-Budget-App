require 'rails_helper'

RSpec.describe 'Category integration tests', type: :feature do
    include Devise::Test::IntegrationHelpers

    before do
        @user = User.create!(name: 'user', email: 'user@gmail.com', password: 'password')

        @category = Category.create!(name: 'Mc Donalds', icon: 'food_icon.webp', author_id: @user.id)
        @expense = Expense.create!(name: 'Expense', amount: 100, author_id: @user.id)
        @expense_category = ExpenseCategory.create!(category_id: @category.id, expense_id: @expense.id)

        login_as(@user, scope: :user)
    end

    describe 'index page' do
        before { visit categories_path }

        it 'should display the title "Categories"' do
            expect(page).to have_content('Categories')
        end

        it 'should display the category name' do
            expect(page).to have_content(@category.name)
        end

        it 'should display the category icon' do
            expect(page).to have_selector("img")
        end
    end
end