@user = User.create!(
        name:"admin",
        email:"admin@admin.com"
        )

Task.create!(
  [
    {
      title:"today's task",
      content:"todo",
      user_id: @user.id
    },
    {
      title:"tommorrow's task",
      content:"next-todo",
      user_id: @user.id
    }
  ]
)