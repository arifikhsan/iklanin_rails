# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'seed start'

if User.count.zero?
  admin = User.create(email: 'admin@admin.com', password: '123456')
  admin.build_user_detail(name: 'admin')
  admin.save
  admin.admin!

  user = User.create(email: 'user@example.com', password: '123456')
  user.build_user_detail(name: 'user')
  user.save
end

if Category.count.zero?
  Category.create(name: 'Tidak ada kategori')
  cupboard = Category.create(name: 'Perabot')
  cupboard.subcategories.create(name: 'Lemari')
end

if Ad.count.zero?
  ad = Ad.create(
    user: User.admin,
    title: 'Jual lemari pakaian plastik',
    detail: 'Culpa laboris duis est dolore est laboris voluptate sit qui.',
    price: 200000,
    time_start: Time.now,
    time_end: Time.now.tomorrow,
    active: true,
  )
  ad.ad_categories.create(category: Category.first)
end

p 'seed done'
