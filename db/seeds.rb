# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
pp Laboratory.create!(name: "Test Lab 1", city: "Test City 1")
pp Laboratory.create!(name: "Test Lab 2", city: "Test City 2")

pp Pharmacy.create!(name: "Test Pharmacy 1", city: "Test City 1", email: "test@example.com")
pp Pharmacy.create!(name: "Test Pharmacy 2", city: "Test City 2", email: "test2@example.com")

pp Product.create!(name: "Test Med 1")
pp Product.create!(name: "Test Med 2")

pp LabInventory.create!(product_id: 1, laboratory_id: 1, quantity: 30, per_unit_cost: 5)
pp LabInventory.create!(product_id: 2, laboratory_id: 2, quantity: 20, per_unit_cost: 3)

pp Stock.create!(product_id: 1, pharmacy_id: 1, quantity: 7, price: 10 )
pp Stock.create!(product_id: 2, pharmacy_id: 1, quantity: 10, price: 12 )
pp Stock.create!(product_id: 2, pharmacy_id: 1, quantity: 9, price: 13 )
