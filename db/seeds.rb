# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TestsResult.destroy_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all

categories = Category.create([
               { title: 'Backend' },
               { title: 'Frontend' },
               { title: 'Analytics' },
               { title: 'Unknown' }
             ])

users = User.create([
           { name: 'Lena' },
           { name: 'Alex' },
           { name: 'Kate' }
         ])

tests = Test.create([
           { title: 'Ruby', level: 1, category_id:  categories[0].id, author_id: users[1].id},
           { title: 'Rails', level: 2, category_id:  categories[0].id, author_id: users[1].id},
           { title: 'Probability theory', level: 2, category_id:  categories[2].id, author_id: users[0].id},
           { title: 'ML', level: 1, category_id:  categories[2].id, author_id: users[0].id},
           { title: 'JavaScript', level: 1, category_id:  categories[1].id, author_id: users[2].id},
           { title: 'CSS', level: 0, category_id:  categories[1].id, author_id: users[2].id},
         ])

Question.create([
               {body: 'Question 1', test_id: tests[0].id},
               {body: 'Question 2', test_id: tests[0].id},
               {body: 'Question 3', test_id: tests[0].id},
               {body: 'Question 4', test_id: tests[2].id},
               {body: 'Question 5', test_id: tests[3].id},
               {body: 'Question 6', test_id: tests[4].id},
               {body: 'Question 7', test_id: tests[4].id},
             ])

TestsResult.create([
                     { test_id: tests[0].id, user_id: users[0].id, result: 10 },
                     { test_id: tests[1].id, user_id: users[1].id, result: 5 },
                     { test_id: tests[2].id, user_id: users[2].id, result: 7 },
                     { test_id: tests[3].id, user_id: users[2].id, result: 4 },
                     { test_id: tests[4].id, user_id: users[2].id, result: 8 },
                     { test_id: tests[5].id, user_id: users[1].id, result: 7 },
                     { test_id: tests[3].id, user_id: users[1].id, result: 6 },
                     { test_id: tests[1].id, user_id: users[0].id, result: 7 }
                   ])

