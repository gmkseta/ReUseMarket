# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

csv_text = File.read(Rails.root.join('lib', 'seeds', 'user_seeds.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'utf-8')
csv.each do |row|
  a = row.to_hash.without(row.to_hash.first[0])
  a["email"] = row[0]
  a["profile_img"] = File.open(File.join(Rails.root,"lib","seeds","img",a["profile_img"]))
  User.create(a)
  puts "create"+a.to_s
end


csv_text = File.read(Rails.root.join('lib', 'seeds', 'item_seeds.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'utf-8')
csv.each do |row|
  a = row.to_hash.without(row.to_hash.first[0])
  a["name"] = row[0]
  a["item_images"] = [File.open(File.join(Rails.root,"lib","seeds","img",a["item_images"]))]
  a["content"]=a["content"].gsub("$!@#%","\r\n")
  Item.create(a)
  puts "create"+a.to_s
end


csv_text = File.read(Rails.root.join('lib', 'seeds', 'trade_seeds.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'utf-8')
csv.each do |row|
  a = row.to_hash.without(row.to_hash.first[0])
  a["seller_id"] = row[0]
  Trade.create(a)
  puts "create"+a.to_s
end

Trade.update_item_status();
AdminUser.create!(email: 'admin@reusemarket.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
