# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'legends@gmail.com',
    password: 'legends'
  )

users = User.create!(
  [
   {email: 'tabaka@example.com', name: '田中', password: 'tanaka', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
   {email: 'saitou@example.com', name: '斉藤', password: 'saitou', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
   {email: 'mizuno@example.com', name: '水野', password: 'mizuno', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
   {email: 'suzuki@example.com', name: '鈴木', password: 'suzuki', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
   {email: 'michael@example.com', name: 'マイケル', password: 'michael', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user4.jpg")},
  ]
)

 tweet = Tweet.create!(
   [
    {title: '鷲ヶ岳',   body: 'レストランおすすめです。',           user_id: users[0].id},
    {title: 'ニセコ',   body: 'コースが豊富でした。',               user_id: users[0].id},
    {title: '高鷲',     body: '上級者向けでした。',                 user_id: users[1].id},
    {title: '旭岳',     body: 'ファミリー向けでした。',             user_id: users[1].id},
    {title: '富良野',   body: '初心者でも滑りやすかったです。',     user_id: users[2].id},
    {title: '石狩',     body: '締めの温泉最高でした。',             user_id: users[3].id},
    {title: '白馬五竜', body: '山頂からの景色は最高でした。',       user_id: users[4].id},
       ]
     )