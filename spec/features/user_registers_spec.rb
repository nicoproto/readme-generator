require "rails_helper"

feature "User registers" do
  scenario "with valid details" do
    visit "/"

    click_link "Log In"
    expect(current_path).to eq(new_user_session_path)

    click_link "Sign up"
    expect(current_path).to eq(new_user_registration_path)

    fill_in "Email", with: "tester@example.com"
    # Using find because fill_in 'password' would raise an Ambigous error
    find("#user_password").set("password")
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(current_path).to eq "/"

    expect(page).to have_content(
      "Welcome! You have signed up successfully."
    )
  end

  context "with invalid details" do
    before do
      visit new_user_registration_path
    end

    scenario "blank fields" do
      expect_fields_to_be_blank

      click_button "Sign up"

      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
    end

    scenario "already registered email" do
      create(:user, email: "tester@example.com")

      fill_in "Email", with: "tester@example.com"
      # Using find because fill_in 'password' would raise an Ambigous error
      find("#user_password").set("password")
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"

      expect(page).to have_content "Email has already been taken"
    end

    scenario "invalid email" do
      fill_in "Email", with: "invalid-email-for-testing"
      find("#user_password").set("password")
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"

      expect(page).to have_content "Email is invalid"
    end

    scenario "too short password" do
      fill_in "Email", with: "someone@example.tld"
      find("#user_password").set("pass")
      fill_in "Password confirmation", with: "pass"
      click_button "Sign up"

      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end

  private

  def expect_fields_to_be_blank
    expect(page).to have_field("Email", with: "", type: "email")
    # These password fields don't have value attributes in the generated HTML,
    # so with: syntax doesn't work.
    expect(find(id: "user_password").value).to be_nil
    expect(find_field("Password confirmation", type: "password").value).to be_nil
  end
end