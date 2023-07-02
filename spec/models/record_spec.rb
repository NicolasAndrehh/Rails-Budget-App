require 'rails_helper'

RSpec.describe Record, type: :model do

    before(:each) do
        @user = User.create(name: "Nicolas", email: "nicolas@gmail.com", password: "password")
        @record = Record.new(name: "Example Record", amount: 100, author_id: @user.id)
    end

    describe "initialization" do
        it 'should be a Record object' do
            expect(@record).to be_a Record
        end

        it 'should have attributes' do
            expect(@record).to have_attributes(name: "Example Record", amount: 100, author_id: @user.id)
        end
    end

    describe "validations" do
        before(:each) do
            expect(@record).to be_valid
        end

        it 'should validate presence of name' do
            @record.name = nil
            expect(@record).not_to be_valid
        end

        it 'should validate length of name' do
            @record.name = "a"
            expect(@record).not_to be_valid
            @record.name = "a" * 26
            expect(@record).not_to be_valid
        end

        it 'should validate presence of amount' do
            @record.amount = nil
            expect(@record).not_to be_valid
        end

        it 'should validate numericality of amount' do
            @record.amount = "a"
            expect(@record).not_to be_valid
            @record.amount = -1
            expect(@record).not_to be_valid
        end

        it 'should validate presence of author_id' do
            @record.author_id = nil
            expect(@record).not_to be_valid
        end

    end
end