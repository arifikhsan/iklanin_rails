json.data do
  json.id @user_detail.id
  json.name @user_detail.name
  json.phone_number @user_detail.phone_number
  json.whatsapp_phone_number @user_detail.whatsapp_phone_number
  json.address @user_detail.address
  json.dob @user_detail.dob
  json.gender @user_detail.gender
end
