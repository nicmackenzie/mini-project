# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Supplier.create([{name: 'Supplier 1', contact: '0722000000',email: 'test@example.com'},{name: 'Supplier 2', contact: '07111234234',email: 'supplier2@example.com'}])
Product.create([{name: 'Product 1', category: 'Electricals', current_qty: 1, supplier_id: 1,price: 2500},
                {name: 'Product 2', category: 'Smart Phones', current_qty: 23, supplier_id: 1,price: 23000},
                {name: 'Product 3', category: 'Electricals', current_qty: 6, supplier_id: 2,price: 3000}])