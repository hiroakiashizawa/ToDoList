User.create!(
  name:"admin",
  email:"admin@admin.com"
)

Task.create!(
  [
    {
      title:"today's task",
      content:"todo",
      user_id: 1
    },
    {
      title:"tommorrow's task",
      content:"next-todo",
      user_id: 1
    }
  ]
)