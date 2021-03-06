require 'spec_helper'

describe "Authentication" do
  subject { page }
  
  describe "signin page" do
    before { visit signin_path }
    
    describe "title" do
      it { should have_title('Sign In')}
    end
    
    describe "Form" do
      it { should have_content('Sign In')}
      it { should have_field('Username or Email')}
      it { should have_field('Password')}
    end
    
    describe "Signup from login" do
      it { should have_content("Don't have an account?")}
      it { should have_link("Signup", href: signup_path)}
    end
  end
  
  describe "signin" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before { click_button "Sign in"}
      
      it { should have_title('Sign In')}
      it { should have_selector('div#flash_error')}
      
      describe "after visiting another page" do
        before { click_link "Home" }
        
        it { should_not have_selector('div#flash_error')}
      end
    end
    
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Username or Email",    with: user.email.upcase
        fill_in "Password",             with: user.password
        click_button "Sign in"
      end
      
      it { should have_title(user.first_name) }
      it { should have_link('Profile') }
      it { should have_link('Logout') }
      it { should have_link('Account Settings') }
      
      it { should_not have_link('Login') }
      it { should_not have_link('Signup') }
      
      describe "followed by signout" do
        before { click_link "Logout" }
        it { should have_link('Login') }
      end
    end
  end
end
