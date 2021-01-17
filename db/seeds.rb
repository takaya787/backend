# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  [
    {
      name: 'takaya',
      email: 'takaya@gmail.com',
      password: 'password',
      password_confirmation: 'password',
    },
    {
      name: 'example',
      email: 'example@gmail.com',
      password: 'example',
      password_confirmation: 'example',
    },
  ]
)

# Review.create!(
#   [
#     {
#       "review" : {
#           "reason":"reason",
#           "duration":"12",
#           "advice":"advice",
#           "food":"food",
#           "convenient":"convenient",
#           "favorite":"favorite",
#           "score":"3.5"
#       },
#       "lat":"",
#       "lng":""
#     }
#   ]
# )
