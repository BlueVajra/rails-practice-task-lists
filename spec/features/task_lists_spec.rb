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

  scenario 'User can complete a task' do
    user = create_user email: "user@example.com"
    log_in_user(user)

    task_list = TaskList.create!(name: "Work List")
    create_task(
      description: "Buy stuff",
      task_list_id: task_list.id
    )

    visit root_path
    expect(page).to have_content "Buy stuff"
    click_button "Complete"

    expect(page).to_not have_content "Buy stuff"
  end

  scenario 'User sees tasks in order of their due date' do
    user = create_user email: "user@example.com"
    log_in_user(user)

    task_list = TaskList.create!(name: "Work List")
    next_task = create_task(
      description: "Buy other stuff",
      task_list_id: task_list.id,
      due_date: 2.days.from_now
    )
    first_task = create_task(
      description: "Buy stuff",
      task_list_id: task_list.id,
      due_date: 1.day.from_now
    )

    visit root_path
    expect(page.body.index(first_task.description)).to be < page.body.index(next_task.description)
  end
end