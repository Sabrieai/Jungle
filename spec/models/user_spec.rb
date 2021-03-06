require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should save when provided all info and password and confirmation match" do
      @user = User.create(first_name: "John",last_name:"Crowley", email: "Jo@hn.com", password: "pepe-the-frog", password_confirmation: "pepe-the-frog")

      expect(@user.id).to be_present
    end

    it "shouldn't save when password and confirmation don't match" do 
      @user = User.create(first_name: "John",last_name:"Crowley", email: "Jo@hn.com", password: "pepe", password_confirmation: "peep")

      expect(@user.id).to be_nil
    end

    it "shouldn't save without a name" do
      @user = User.create(first_name: nil,last_name:"Crowley", email: "Jo@hn.com", password: "pepe-the-frog", password_confirmation: "peep-the-frog")

      expect(@user.id).to be_nil
    end

    it "shouldn't save without a email" do
      @user = User.create(first_name: "John",last_name: nil, email: "Jo@hn.com", password: "pepe-the-frog", password_confirmation: "peep-the-frog")

      expect(@user.id).to be_nil
    end

    it "shouldn't save without a password" do
      @user = User.create(first_name: "John",last_name:"Crowley", email: "Jo@hn.com", password: nil, password_confirmation: nil)

      expect(@user.id).to be_nil
    end

    it "shouldn't save with a too short password" do
      @user = User.create(first_name: "John",last_name:"Crowley", email: "Jo@hn.com", password: "short", password_confirmation: "short")

      expect(@user.id).to be_nil
    end

    it "shouldn't save without confirmation" do
      @user = User.create(first_name: "John",last_name:"Crowley", email: "Jo@hn.com", password: "pepe-the-frog", password_confirmation: nil)

      expect(@user.id).to be_nil
    end

    it "should save when email is unique" do
      @user1 = User.create(first_name: "Buster",last_name:"Zippa", email: "buzz@cuts.com", password: "zzzsleep", password_confirmation: "zzzsleep")
      @user2 = User.create(first_name: "John",last_name:"Crowley", email: "Jo@hn.com", password: "pepe-the-frog", password_confirmation: "pepe-the-frog")

      expect(@user2.id).to be_present
    end

    it "shouldn't save when email is not unique" do
      @user1 = User.create(first_name: "Buster",last_name:"Zippa", email: "buzz@cuts.com", password: "zzzsleep", password_confirmation: "zzzsleep")
      @user2 = User.create(first_name: "John",last_name:"Crowley", email: "Buzz@CUTS.com", password: "pepe-the-frog", password_confirmation: "pepe-the-frog")

      expect(@user2.id).to be_nil
    end

  end

  describe '.authenticate_with_credentials' do

    it "should return the correct user with their credentials" do 
      @user1 = User.create(first_name: "Buster",last_name:"Zippa", email: "buzz@cuts.com", password: "zzzsleep", password_confirmation: "zzzsleep")
      @user = User.authenticate_with_credentials("buzz@cuts.com", "zzzsleep")

      expect(@user.id).to be @user1.id
    end
  
    it "should return nil when email or password are blank" do 
      @user = User.create(first_name: "Buster",last_name:"Zippa", email: "buzz@cuts.com", password: "zzzsleep", password_confirmation: "zzzsleep")
      @user1 = User.authenticate_with_credentials("buzz@cuts.com", nil)
      @user2 = User.authenticate_with_credentials(nil, "zzzsleep")

      expect(@user2).to be_nil
      expect(@user2).to be_nil
    end
    it "should return nil when email or password are invalid" do 
      @user = User.create(first_name: "Buster",last_name:"Zippa", email: "buzz@cuts.com", password: "zzzsleep", password_confirmation: "zzzsleep")
      @user1 = User.authenticate_with_credentials("buzz@cuts.com", "zzzresting")
      @user2 = User.authenticate_with_credentials("fade@styles.com", "zzzsleep")

      expect(@user2).to be_nil
      expect(@user2).to be_nil
    end

    it "should return user if there are spaces before or after their email" do 
      @user = User.create(first_name: "Buster",last_name:"Zippa", email: "buzz@cuts.com", password: "zzzsleep", password_confirmation: "zzzsleep")
      @user1 = User.authenticate_with_credentials("  buzz@cuts.com  ", "zzzsleep")

      expect(@user1.id).to be @user.id
    end

    it "should return user if the email is in the wrong case" do 
      @user = User.create(first_name: "Buster",last_name:"Zippa", email: "buzz@cuts.com", password: "zzzsleep", password_confirmation: "zzzsleep")
      @user1 = User.authenticate_with_credentials("BUZZ@CUTS.COM", "zzzsleep")

      expect(@user1.id).to be @user.id
    end

  end

end
