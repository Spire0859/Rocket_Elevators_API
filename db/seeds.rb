# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongsuser_ide the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.create(email: 'mathieu.houde@codeboxx.biz',)
# User.create(email: 'patrick.thibault@codeboxx.biz',)
# User.create(email: 'francis.patry-jessop@codeboxx.biz',)
# User.create(email: 'davuser_id.amyot@codeboxx.biz',)
# User.create(email: 'marie-eve.goupil@codeboxx.biz',)
# User.create(email: 'francois.boivin@codeboxx.biz',)
# User.create(email: 'timothy.wever@codeboxx.biz',)
# User.create(email: 'kiril.kleinerman@codeboxx.biz',)
# User.create(email: 'felicia.hartono@codeboxx.biz',)
# User.create(email: 'eileen.ai@codeboxx.biz',)



# users = [
    
#     {email: 'mathieu.houde@codeboxx.biz' ,password: '123456' ,employee: true},
#     {email: 'patrick.thibault@codeboxx.biz',password: '123456',employee: true},
#     {email: 'francis.patry-jessop@codeboxx.biz',password: '123456',employee: true},
#     {email: 'david.amyot@codeboxx.biz',password: '123456',employee: true},
#     {email: 'marie-eve.goupil@codeboxx.biz',password: '123456',employee: true},
#     {email: 'francois.boivin@codeboxx.biz',password: '123456',employee: true},
#     {email: 'timothy.wever@codeboxx.biz',password: '123456',employee: true},
#     {email: 'kiril.kleinerman@codeboxx.biz',password: '123456',employee: true},
#     {email: 'felicia.hartono@codeboxx.biz',password: '123456',employee: true},
#     {email: 'eileen.ai@codeboxx.biz',password: '123456',employee: true},
# ]


# employees = [
    
#     {user_id: '1' ,lastName: 'Houde' ,firstNname: 'Mathieu' ,title: 'Gopher' },
#     {user_id: '2' ,lastName: 'Thibault' ,firstNname: 'Patrick ' ,title: 'Maximalist' },
#     {user_id: '3' ,lastName: 'Patry-Jessop' ,firstNname: 'Francis ' ,title: 'Captain' },
#     {user_id: '4' ,lastName: 'Amyot' ,firstNname: 'Davuser_id' ,title: 'The Man' },
#     {user_id: '5' ,lastName: 'Goupil' ,firstNname: 'Marie-Ève ' ,title: 'AI Master' },
#     {user_id: '6' ,lastName: 'Boivin' ,firstNname: 'François' ,title: 'The Tank' },
#     {user_id: '7' ,lastName: 'Wever' ,firstNname: 'Timothy' ,title: 'Beard whisperer' },
#     {user_id: '8' ,lastName: 'Kleinerman' ,firstNname: 'Kiril' ,title: 'I <3 Winnipeg' },
#     {user_id: '9' ,lastName: 'Hartono' ,firstNname: 'Felicia' ,title: 'Scrums are too early' },
#     {user_id: '10' ,lastName: 'Ai' ,firstNname: 'Eileen' ,title: 'They really are.' },
# ]



# users.each do |user|
#     this_user = User.where(
#         email: user[:email], 
#     ).first_or_initialize

#     this_user.update!(
#         password: user[:password],
#         employee: user[:employee],
#     )
#     this_user.save
# end

# c = User.find(1)

# p User.find(1)
User.create(email: 'mathieu.houde@codeboxx.biz' ,password: '123456' ,employee: true)


Employee.create(lastName: 'Houde' ,firstNname: 'Mathieu' ,title: 'Gopher', user_id: 1)




    
# employees.each do |employee|
#     this_employee = Employee.where(
#         user_id: employee[:user_id], 
#     ).first_or_initialize

#     this_employee.update!(
#         lastName: employee[:lastName],
#         firstNname: employee[:firstNname],
#         title: employee[:title]
#     )
#     this_employee.save
# end