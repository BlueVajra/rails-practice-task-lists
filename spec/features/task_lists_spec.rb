require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do

  scenario 'User can view task lists' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")
  end

  scenario 'User can add a task' do
    include 'active_support/core_ext/date/calculations.rb'
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    click_link "+Add Task"
    fill_in "Description", with: "Email Julia"
    select_date 5.days.from_now, from: :task_due_date
    click_button "Create Task"

    expect(page).to have_content "Task was created successfully!"
    expect(page).to have_content "Email Julia"
    expect(page).to have_content ("(5 days)")
  end
end