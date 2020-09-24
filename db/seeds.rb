# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'seed start'

if User.count.zero?
  admin = User.create(email: 'admin@example.com', password: '123456')
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
  Category.create(name: 'Lainnya')
end

if Setting.count.zero?
  Setting.create(key: 'max_free', value: 3, detail: 'maksimal gratis iklan')
  Setting.create(key: 'max_duration_free', value: 90, detail: 'maksimal iklan tayang per hari')
end

if Item.count.zero?
  Item.create(
    user: User.admin,
    category: Category.stuff,
    title: 'Jual lemari pakaian plastik',
    detail: 'Consectetur ea est id excepteur eu ea ullamco nostrud nisi occaecat Lorem. Magna voluptate reprehenderit commodo voluptate labore qui reprehenderit sit. Irure exercitation consectetur id ex ullamco exercitation voluptate culpa adipisicing sit enim cupidatat. Aliquip est officia cupidatat est minim id laboris nostrud irure minim ullamco tempor aliqua mollit.',
    price: 200000,
    status: Item.statuses[:published],
    time_start: Time.now,
    time_end: Time.now + 1.year,
  )
  Item.create(
    user: User.admin,
    category: Category.service,
    title: 'Jasa membersihkan rumah luar dalam',
    detail: 'Esse id ea quis ipsum ex enim commodo est duis amet enim proident. Tempor voluptate ullamco nisi elit culpa amet. Tempor laborum veniam officia item.Lorem adipisicing veniam esse excepteur culpa item.laboris excepteur. Lorem elit laboris qui exercitation Lorem magna nostrud.',
    price: 400000,
    status: Item.statuses[:published],
    time_start: Time.now,
    time_end: Time.now + 1.year,
  )
end


if Rails.env.development?
  10.times do |index|
    user = User.create(email: "user#{index}@example.com", password: '123456')
    user.build_user_detail do |user_detail|
      user_detail.name = "user #{index}"
      user_detail.phone_number = Faker::PhoneNumber.phone_number
      user_detail.whatsapp_phone_number = Faker::PhoneNumber.phone_number
      user_detail.address = Faker::Lorem.sentence
      user_detail.dob = Faker::Date.between(from: '2014-09-23', to: '2014-09-25')
      user_detail.gender = UserDetail.genders[:male]
    end
    user.save
  end

  100.times do
    Category.create(name: Faker::Lorem.unique.word)
  end

  100.times do
    Item.create(
      user: User.all.sample,
      category: Category.all.sample,
      title: Faker::Lorem.sentence,
      detail: Faker::Lorem.paragraph,
      price: Faker::Number.within(range: 10000..900000),
      status: Item.statuses[:published],
      time_start: Time.now,
      time_end: Time.now + 1.year,
    )
  end

  Item.all.map do |item|
    3.times do
      item.images.create do |item_image|
        item_image.name = Faker::Lorem.word + '.jpg'
        item_image.image.attach(io: Rails.root.join('app/assets/images/cat.jpg').open, filename: 'cat.jpg')
        item_image.detail = Faker::Lorem.sentence
        item_image.cover = false
      end
    end

    image_cover = item.images.sample
    image_cover.cover = true
    image_cover.save
  end
end


p 'seed done'
