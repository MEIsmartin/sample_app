require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "signup page" do
		before { visit signup_path }

		it { should have_selector('h1', text: 'Sign Up')}
		it { should have_selector('title', text: full_title('Sign Up'))}
	end

	describe "profile page" do
		let(:foobar) { FactoryGirl.create(:user) }
		before { visit user_path(foobar) }

		it { should have_selector('h1', text: foobar.name) }
		it { should have_selector('title', text: foobar.name) }
	end

end
