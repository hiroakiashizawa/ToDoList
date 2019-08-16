@admin = User.create!(
  name:"admin",
  email:"admin@todo.com",
  password:"password",
  password_confirmation:"password",
  admin:"true"
)

@guest = User.create!(
  name:"guest",
  email:"guest@todo.com",
  password:"password",
  password_confirmation:"password",
  admin:"false"
)

@user1 = User.create!(
  name:"user-1",
  email:"user-1@todo.com",
  password:"password",
  password_confirmation:"password",
  admin:"false"
)

@user2 = User.create!(
  name:"user-2",
  email:"user-2@todo.com",
  password:"password",
  password_confirmation:"password",
  admin:"false"
)

[
  [ "Guest's task-0", "todo", DateTime.now, @guest.id, false, false ],
  [ "Guest's task-1", "todo", DateTime.now, @guest.id, false, false ],
  [ "Guest's task-2", "todo", DateTime.now, @guest.id, false, false ],
  [ "Guest's task-3", "todo", DateTime.now, @guest.id, false, false ],
  [ "Guest's task-4", "todo", DateTime.now, @guest.id, false, false ],
  [ "Guest's task-5", "todo", DateTime.now, @guest.id, false, false ],
  [ "Guest's task-6", "todo", DateTime.now, @guest.id, false, false ],
  [ "Guest's task-7", "todo", DateTime.now, @guest.id, false, false ],
  [ "Guest's task-8", "todo", DateTime.now, @guest.id, false, false ],
  [ "Guest's task-9", "todo", DateTime.now, @guest.id, false, false ],
  [ "Guest's task-10", "todo", DateTime.now, @guest.id, false, false ],

  [ "User1's task-0", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-1", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-2", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-3", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-4", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-5", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-6", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-7", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-8", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-9", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-10", "todo", DateTime.now, @user1.id, false, false ],
  [ "User1's task-11", "todo", DateTime.now, @user1.id, false, false ],
  [ "completed task", "next-todo", DateTime.now, @user1.id, true, false ],
  [ "deleted task", "next-todo", DateTime.now, @user1.id, false, true ],

  [ "User2's task-0", "next-todo", DateTime.now, @user2.id, false, false ],
  [ "User2's task-1", "next-todo", DateTime.now, @user2.id, false, false ],
  [ "User2's task-2", "next-todo", DateTime.now, @user2.id, false, false ],
  [ "User2's task-3", "next-todo", DateTime.now, @user2.id, false, false ],
  [ "User2's task-4", "next-todo", DateTime.now, @user2.id, false, false ],
  [ "User2's task-5", "next-todo", DateTime.now, @user2.id, false, false ],
  [ "User2's task-6", "next-todo", DateTime.now, @user2.id, false, false ],
  [ "User2's task-7", "next-todo", DateTime.now, @user2.id, false, false ],
  [ "User2's task-8", "next-todo", DateTime.now, @user2.id, false, false ],
  [ "User2's task-9", "next-todo", DateTime.now, @user2.id, false, false ],
  [ "User2's task-10", "next-todo", DateTime.now, @user2.id, false, false ],

].each do |title, content, timelimit, user_id, completed, deleted|
  Task.create!(
    { title: title,
      content: content,
      timelimit: timelimit,
      user_id: user_id,
      completed: completed,
      deleted: deleted
    }
  )
end