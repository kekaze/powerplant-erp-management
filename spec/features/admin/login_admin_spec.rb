require 'rails_helper'

feature "admin registers a new user" do
    before(:each) do 
        #create a test admin account
        FactoryBot.create(:user, email: "yanson.jr@saprevamped.com", last_name: "Yanson", first_name: "Justine", role_id: 9,password: "supersecretseed", password_confirmation: "supersecretseed", status: "Active")
    end
    scenario "admin succesfully logs in" do
        visit login_path
        fill_in "email", with: "yanson.jr@saprevamped.com"
        fill_in "password", with: "supersecretseed"
        click_button "Login"
        # expect(page).to have_content "User successfully created"
        expect(page).to have_current_path(admin_path)
    end
    scenario "admin fails to log in" do
        visit login_path
        fill_in "email", with: ""
        fill_in "password", with: "supersecretseed"
        click_button "Login"
        # expect(page).to have_content "User successfully created"
        expect(page).to have_current_path(login_path)
    end
    scenario "successfully creates a new user account" do
        visit login_path
        fill_in "email", with: "yanson.jr@saprevamped.com"
        fill_in "password", with: "supersecretseed"
        click_button "Login"
        # expect(page).to have_content "User successfully created"
        expect(page).to have_current_path(admin_path)
        click_button "Account Registration"
    end
end

=begin
    roles = {
        1 => "Requestor",
        2 => "Reviewer",
        3 => "Approver",
        4 => "Regular",
        9 => "Administrator"
    }

    department = {
        1 => "Operations",
        2 => "Maintenance",
        3 => "Warehouse",
        4 => "Finance",
        5 => "IT"
    }
=end