4.times do
  name = Faker::Name.name
  description = Faker::Lorem.sentence(5)
  Department.create! name: name, description: description
end

departments = Department.order(:created_at).take(4)
15.times do |n|
  name = Faker::Name.name
  email = "duytu#{n+1}@gmail.org"
  departments.each { |department| department.users.create! name: name, email: email, password: "12345678", password_confirmation: "12345678", address: "Ha Noi", birthday: Time.zone.now, phone: "0987654321", gender: "man"}
end
