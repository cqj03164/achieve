# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

n = 1
while n <= 100
  Blog.create(
    title: "投稿#{n}回目",
    content: "中身#{n}回目",
    user_id: n
  )
  n = n + 1
end
