require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user) # using the user factory bot, not the fixture
    end
    describe 'New user registration' do
      context 'When new registration works' do
        it 'Can register if all fields filled' do
          expect(@user).to be_valid
        end
        it 'Can register if |password| > 6' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          expect(@user).to be_valid
        end
      end

      context 'When new registration fails' do
        it 'Cannot register if email is empty' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('Email can\'t be blank')
        end
        it 'Cannot register if there are duplicate emails' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'Cannot register if password is empty' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('Password can\'t be blank')
        end
        it 'Cannot register if confirmation does not match' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
        end
        it 'Cannot register if password is 5 characters or less' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
      end
    end
  end
end