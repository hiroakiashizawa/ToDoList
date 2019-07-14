@admin = User.create!(
  name:"admin",
  email:"admin@todo.com",
  password:"password",
  password_confirmation:"password",
  admin:"true"
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
      title:"User1's task",
      content:"todo",
      timelimit:DateTime.now,
      user_id: @user1.id
    },
    {
      title:"User2's task",
      content:"next-todo",
      timelimit:DateTime.now,
      user_id: @user2.id
    }
  ]
)