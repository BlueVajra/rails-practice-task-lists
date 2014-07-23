def create_user(overrides = {})
  User.create!({
    name: 'Some User',
    email: 'user@example.com',
    password: 'password',
    password_confirmation: 'password'
  }.merge(overrides))
end

def create_task(overrides = {})
  Task.create!({
    description: "New Task",
    due_date: 5.days.from_now,
  }.merge(overrides))
end