# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.create(email: 'mathieu.houde@codeboxx.biz',)
# User.create(email: 'patrick.thibault@codeboxx.biz',)
# User.create(email: 'francis.patry-jessop@codeboxx.biz',)
# User.create(email: 'david.amyot@codeboxx.biz',)
# User.create(email: 'marie-eve.goupil@codeboxx.biz',)
# User.create(email: 'francois.boivin@codeboxx.biz',)
# User.create(email: 'timothy.wever@codeboxx.biz',)
# User.create(email: 'kiril.kleinerman@codeboxx.biz',)
# User.create(email: 'felicia.hartono@codeboxx.biz',)
# User.create(email: 'eileen.ai@codeboxx.biz',)

users = [
    
    {email: 'mathieu.houde@codeboxx.biz',password: '123456',employee: true},
    {email: 'patrick.thibault@codeboxx.biz',password: '123456',employee: true},
    {email: 'francis.patry-jessop@codeboxx.biz',password: '123456',employee: true},
    {email: 'david.amyot@codeboxx.biz',password: '123456',employee: true},
    {email: 'marie-eve.goupil@codeboxx.biz',password: '123456',employee: true},
    {email: 'francois.boivin@codeboxx.biz',password: '123456',employee: true},
    {email: 'timothy.wever@codeboxx.biz',password: '123456',employee: true},
    {email: 'kiril.kleinerman@codeboxx.biz',password: '123456',employee: true},
    {email: 'felicia.hartono@codeboxx.biz',password: '123456',employee: true},
    {email: 'eileen.ai@codeboxx.biz',password: '123456',employee: true},
    {email: 'tanim@codeboxx.biz',password: '123456',employee: false},

]

users.each do |user|
    this_user = User.where(
        email: user[:email], 
    ).first_or_initialize

    this_user.update!(
        password: user[:password],
        employee: user[:employee],
    )
    this_user.save
end

    
