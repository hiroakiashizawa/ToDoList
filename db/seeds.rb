@user = User.create!(
        name:"admin",
        email:"admin@admin.com",
        password:"password",
        password_confirmation:"password"
        )

Task.create!(
  [
    {
      title:"today's task",
      content:"todo",
      timelimit:DateTime.now,
      user_id: @user.id
    },
    {
      title:"tommorrow's task",
      content:"next-todo",
      timelimit:DateTime.now,
      user_id: @user.id
    }
  ]
)