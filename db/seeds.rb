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

Task.create!(
  [
    {
      title:"Guest's task",
      content:"todo",
      timelimit:DateTime.now,
      user_id: @guest.id,
      completed: false,
      deleted: false
    },
    {
      title:"User1's task",
      content:"todo",
      timelimit:DateTime.now,
      user_id: @user1.id,
      completed: false,
      deleted: false
    },
    {
      title:"User2's task",
      content:"next-todo",
      timelimit:DateTime.now,
      user_id: @user2.id,
      completed: false,
      deleted: false
    },
    {
      title:"completed task",
      content:"next-todo",
      timelimit:DateTime.now,
      user_id: @user1.id,
      completed: true,
      deleted: false
    },
    {
      title:"deleted task",
      content:"next-todo",
      timelimit:DateTime.now,
      user_id: @user1.id,
      completed: false,
      deleted: true
    }

  ]
)