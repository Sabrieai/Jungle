require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should save when password and confirmation match" do
      @user = User.create(first_name: "John",last_name:"Crowley", email: "Jo@hn.com", password: "pepe", password_confirmation: "pepe")

      expect(@user.id).to be_present
    end

    it "shouldn't save when password and confirmation don't match" do 
      @user = User.create(first_name: "John",last_name:"Crowley", email: "Jo@hn.com", password: "pepe", password_confirmation: "peep")

      expect(@user.id).to be_nil
    end

    it "Should save when email is unique" do
      @user1 = User.create(first_name: "Buster",last_name:"Zippa", email: "buzz@cuts.com", password: "zzz", password_confirmation: "zzz")
      @user2 = User.create(first_name: "John",last_name:"Crowley", email: "Jo@hn.com", password: "pepe", password_confirmation: "pepe")

      expect(@user2.id).to be_present
    end

    it "Shouldn't save when email is not unique" do
      @user1 = User.create(first_name: "Buster",last_name:"Zippa", email: "buzz@cuts.com", password: "zzz", password_confirmation: "zzz")
      @user2 = User.create(first_name: "John",last_name:"Crowley", email: "buzz@cuts.com", password: "pepe", password_confirmation: "pepe")

      expect(@user2.id).to be_nil
    end

    xit "should save when provided name, email, and password" do
    end

    xit "shouldn't save without a name" do
    end

    xit "shouldn't save without a email" do
    end

    xit "shouldn't save without a password" do
    end
  end

end
