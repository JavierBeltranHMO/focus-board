# Users
user1=User.create!(
  email: "user1@example.com",
  password: "password",
  password_confirmation: "password"
)
user2=User.create!(
  email: "user2@example.com",
  password: "password",
  password_confirmation: "password"
)
user3=User.create!(
  email: "user3@example.com",
  password: "password",
  password_confirmation: "password"
)

# Shared Board from user1
sharedBoard=Board.create!(title: "Demo Project", user: user1)


# Sharing
sharedBoard.collaborators << user2
sharedBoard.collaborators << user3

# Lists
todo=sharedBoard.lists.create!(title: "To Do", row_order: 0)
doing=sharedBoard.lists.create!(title: "In Progress", row_order: 1)
done=sharedBoard.lists.create!(title: "Done", row_order: 2)


# Tasks
todo.tasks.create!(title: "Setup project", description: "Create repo and set up Rails", row_order: 0)
doing.tasks.create!(title: "Design databse", description: "Define models and relations", row_order: 1)
done.tasks.create!(title: "Deploy to Render", description: "First production deploy", row_order: 2)
