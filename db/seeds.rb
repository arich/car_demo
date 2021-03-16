# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brands = %w(subaru vw audi bmw toyota volvo)
brands.each do |b|
  Brand.create!(name: b)
end

subaru = Brand.find_by(name: 'subaru')
subaru_cars = %w(crosstrek impreza legacy)

subaru_cars.each do |c|
  Car.create(brand: subaru, name: c)
end

vw = Brand.find_by(name: 'vw')
vw_cars = %w(jetta tiguan golf)

vw_cars.each do |c|
  Car.create(brand: vw, name: c)
end
