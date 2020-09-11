json.data do
  json.id @ad.id
  json.title @ad.title
  json.slug @ad.slug
  json.detail @ad.detail
  json.price @ad.price
  json.time_start @ad.time_start
  json.time_end @ad.time_end
  json.status @ad.status
  json.user do
    json.name @ad.user.name
    json.email @ad.user.email
  end
  json.category do
    json.name @ad.category.name
  end
end