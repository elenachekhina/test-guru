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

categories = Category.create!([
                                { title: 'Backend' },
                                { title: 'Frontend' },
                                { title: 'Analytics' },
                                { title: 'Unknown' }
                              ])

users = User.create!([
                       { name: 'Lena' },
                       { name: 'Alex' },
                       { name: 'Kate' }
                     ])

tests = Test.create!([
                       { title: 'Ruby', level: 1, category: categories[0], author: users[1] },
                       { title: 'Rails', level: 2, category: categories[0], author: users[1] },
                       { title: 'Probability theory', level: 2, category: categories[2], author: users[0] },
                       { title: 'ML', level: 1, category: categories[2], author: users[0] },
                       { title: 'JavaScript', level: 1, category: categories[1], author: users[2] },
                       { title: 'CSS', level: 0, category: categories[1], author: users[2] }
                     ])

questions = Question.create!([
                               { body: 'Question 1', test: tests[0] },
                               { body: 'Question 2', test: tests[0] },
                               { body: 'Question 3', test: tests[0] },
                               { body: 'Question 4', test: tests[2] },
                               { body: 'Question 5', test: tests[3] },
                               { body: 'Question 6', test: tests[4] },
                               { body: 'Question 7', test: tests[4] }
                             ])

TestsResult.create!([
                      { test: tests[0], user: users[0], result: 10 },
                      { test: tests[1], user: users[1], result: 5 },
                      { test: tests[2], user: users[2], result: 7 },
                      { test: tests[3], user: users[2], result: 4 },
                      { test: tests[4], user: users[2], result: 8 },
                      { test: tests[5], user: users[1], result: 7 },
                      { test: tests[3], user: users[1], result: 6 },
                      { test: tests[1], user: users[0], result: 7 }
                    ])

Answer.create!([
                 { body: 'Answer 1', question: questions[0], correct: true },
                 { body: 'Answer 2', question: questions[1], correct: true },
                 { body: 'Answer 3', question: questions[2], correct: true },
                 { body: 'Answer 4', question: questions[3], correct: true },
                 { body: 'Answer 5', question: questions[4], correct: true },
                 { body: 'Answer 6', question: questions[5], correct: true },
                 { body: 'Answer 7', question: questions[6], correct: true }
               ])
