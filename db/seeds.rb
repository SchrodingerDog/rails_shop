# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create([{name: "Home", parent_id: 0}, {name: "Child", parent_id: 1}, {name: "Child of Child", parent_id: 2}])
Product.create([{name: "Product1", price: 15.58, picture: "public/data/1.jpg", catalog_number: 1123, category_id: 3, description: "Descr"}, {name: "Product2", price: 15.59, picture: "public/data/1.jpg", catalog_number: 1124, category_id: 3, description: "Descr"}])