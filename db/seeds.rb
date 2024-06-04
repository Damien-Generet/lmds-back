User.destroy_all
Event.destroy_all

10.times do |index|
    User.create!({
        email: Faker::Internet.email,
        password: Faker::Internet.password
    })
end

User.create!({
    email: "toto@gmail.com",
    password: "123456789"
})

30.times do |index|
    max_seats = rand(5..15)
    Event.create!({
        creator: User.all.sample,
        category: Event::CATEGORIES.sample,
        start_date: Faker::Date.forward(days: 90),
        location: Faker::Address.street_address,
        price: rand(1..10),
        max_seats: rand(1..10)
    })
end
