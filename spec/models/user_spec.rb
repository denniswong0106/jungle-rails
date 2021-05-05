require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "validate" do

    context "all field filled, no dup email, passwords match" do
      before do
        @user = User.create(name: "Example User", email: "user@example.com",
        password: "foobar", password_confirmation: "foobar")
      end
    
      it "should save" do
        expect(@user.save).to be true
      end
    end

    context "has password and password_confirmation fields" do
      before do
        @user = User.create(name: "Example User", email: "user@example.com",
        password: "foobar", password_confirmation: "foobar")
      end
      
      it "are filled" do
        expect(@user).to have_attributes(password: "foobar", password_confirmation: "foobar")
      end
      
      it "and password is equal to password_confirmation" do
        
        expect(@user.password).to eq(@user.password_confirmation)
      end
    end
    
    context "has mismatching password and password_confirmation" do
      before do
        @user = User.create(name: "Example User", email: "user@example.com",
        password: "foobar", password_confirmation: "mismatch")
      end
      
      it "should not save" do
        expect(@user.save).to be false
      end
    end

    context "has unique email" do
      before do
        @user = User.create(name: "Example User", email: "user@example.com",
        password: "foobar", password_confirmation: "foobar")
        @user2 = User.create(name: "Example User", email: "user2@example.com",
        password: "foobar", password_confirmation: "foobar")
      end

      it "should save" do
        expect(@user2.save).to be true
      end
    end

    context "has duplicate email" do
      before do
        @user = User.create(name: "Example User", email: "user@example.com",
        password: "foobar", password_confirmation: "foobar")
        @user2 = User.create(name: "Example User", email: "uSER@example.com",
        password: "foobar", password_confirmation: "foobar")
      end

      it "should not save" do
        expect(@user2.save).to be false
      end
    end

    context "no name provided" do
      before do
        @user = User.create(email: "user@example.com",
        password: "foobar", password_confirmation: "foobar")
      end

      it "should not save" do
        expect(@user.save).to be false
      end
    end

    context "no email provided" do
      before do
        @user = User.create(name: "Example User",
        password: "foobar", password_confirmation: "foobar")
      end

      it "should not save" do
        expect(@user.save).to be false
      end
    end

    context "password length is greater than 5" do
      before do
        @user = User.create(name: "Example User", email: "user@example.com",
        password: "foobar", password_confirmation: "foobar")
      end
      it "should save" do
        expect(@user.save).to be true
      end
    end

    context "password length is 5" do
      before do
        @user = User.create(name: "Example User", email: "user@example.com",
        password: "fooba", password_confirmation: "fooba")
      end
      it "should save" do
        expect(@user.save).to be true
      end
    end

    context "password length is less than 5" do
      before do
        @user = User.create(name: "Example User", email: "user@example.com",
        password: "foob", password_confirmation: "foob")
      end
      it "should not save" do
        expect(@user.save).to be false
      end
    end
  end

  describe ".authenticate_with_credentials" do
    before do
      @user = User.create(name: "Example User", email: "user@example.com",
      password: "foobar", password_confirmation: "foobar")
    end
    context "given correct credentials" do
      it "return an corresponding instance of user" do
        expect(User.authenticate_with_credentials("user@example.com", "foobar")).to eq(@user)
      end
    end

    context "given email with spaces in front" do
      it "return nil" do
        expect(User.authenticate_with_credentials("    user@example.com", "foobar")).to eq(nil)
      end
    end

    context "given email with spaces in behind" do
      it "return nil" do
        expect(User.authenticate_with_credentials("user@example.com    ", "foobar")).to eq(nil)
      end
    end

    context "given email with different case" do
      it "return an corresponding instance of user" do
        expect(User.authenticate_with_credentials("USER@EXAMPLE.COM", "foobar")).to eq(@user)
      end
    end

    context "given wrong email" do
      it "return nil" do
        expect(User.authenticate_with_credentials("user@different.com", "foobar")).to eq(nil)
      end
    end

    context "given wrong password, for correct email" do
      it "return nil" do
        expect(User.authenticate_with_credentials("user@example.com", "wrongpass")).to be false
      end
    end

  end
end




