require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

  end

  it 'is valid' do
    @user = User.new(name: 'chris', email: 'test@test.com', password: '12345', password_confirmation: '12345')
    expect(@user).to be_valid
  end

  it 'is not valid without a name' do
    @user = User.new(name: nil, email: 'test@test.com', password: '12345', password_confirmation: '12345')
    expect(@user).to_not be_valid
  end

  it 'is not valid without an email' do
    @user = User.new(name: 'chris', email: nil, password: '12345', password_confirmation: '12345')
    expect(@user).to_not be_valid
  end

  it 'is not valid without a password' do
    @user = User.new(name: 'chris', email: 'test@test.com', password: '1234', password_confirmation: '1234')
    expect(@user).to_not be_valid
  end

  describe '.authenticate_with_credentials' do
    let(:user) do
      User.create!(
        name: 'TestUserFirstName',
        email: 'test123@test.com',
        password: 'coolpass',
        password_confirmation: 'coolpass'
      )
    end
    it 'is valid with valid credentials' do
      user.save
      expect(User.authenticate_with_credentials('test123@test.com', 'coolpass')).to be_truthy
    end
    it 'is not valid without correct password' do
      user.save
      expect(User.authenticate_with_credentials('test123@test.com', 'letmein')).to be_falsey
    end
    it 'is valid with valid case insensitive emails' do
      user.save
      expect(User.authenticate_with_credentials('TEST123@TEST.COM', 'coolpass')).to be_truthy
    end
    it 'is not valid with emails leading spaces' do
      user.save
      expect(User.authenticate_with_credentials('   test123@test.com', 'coolpass')).to be_falsey
    end
  end
end
