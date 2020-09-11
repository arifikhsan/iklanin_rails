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
  cupboard = Category.create(name: 'Perabot')
  cupboard.child.create(name: 'Lemari')
  Category.create(name: 'Barang')
  Category.create(name: 'Jasa')
end

if Setting.count.zero?
  Setting.create(key: 'max_free', value: 3, detail: 'maksimal gratis iklan')
  Setting.create(key: 'max_duration_free', value: 30, detail: 'maksimal iklan tayang per hari')
end

if Ad.count.zero?
  Ad.create(
    user: User.admin,
    category: Category.stuff,
    title: 'Jual lemari pakaian plastik',
    detail: 'Consectetur ea est id excepteur eu ea ullamco nostrud nisi occaecat Lorem. Magna voluptate reprehenderit commodo voluptate labore qui reprehenderit sit. Irure exercitation consectetur id ex ullamco exercitation voluptate culpa adipisicing sit enim cupidatat. Aliquip est officia cupidatat est minim id laboris nostrud irure minim ullamco tempor aliqua mollit.',
    price: 200000,
    status: Ad.statuses[:published],
    time_start: Time.now,
    time_end: Time.now.tomorrow,
  )
  Ad.create(
    user: User.admin,
    category: Category.service,
    title: 'Jasa membersihkan rumah luar dalam',
    detail: 'Esse id ea quis ipsum ex enim commodo est duis amet enim proident. Tempor voluptate ullamco nisi elit culpa amet. Tempor laborum veniam officia ad Lorem adipisicing veniam esse excepteur culpa ad laboris excepteur. Lorem elit laboris qui exercitation Lorem magna nostrud.',
    price: 400000,
    status: Ad.statuses[:published],
    time_start: Time.now,
    time_end: Time.now.tomorrow,
  )
end


# if Rails.env.development?
#   100.times do
#     Ad.create(
#       user: User.admin,
#       category: Category.service,
#       title: 'Jasa membersihkan rumah luar dalam',
#       detail: 'Esse id ea quis ipsum ex enim commodo est duis amet enim proident. Tempor voluptate ullamco nisi elit culpa amet. Tempor laborum veniam officia ad Lorem adipisicing veniam esse excepteur culpa ad laboris excepteur. Lorem elit laboris qui exercitation Lorem magna nostrud.',
#       price: 400000,
#       status: Ad.statuses[:published],
#       time_start: Time.now,
#       time_end: Time.now.tomorrow,
#     )
#   end
# end


p 'seed done'
