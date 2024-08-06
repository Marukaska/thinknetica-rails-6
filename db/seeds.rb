User.delete_all
Category.delete_all
Test.delete_all
Question.delete_all
Answer.delete_all

# Создание пользователей
users = User.create!([
                       { name: 'Alice', email: 'alice@example.com' },
                       { name: 'Bob', email: 'bob@example.com' },
                       { name: 'Charlie', email: 'charlie@example.com' }
                     ])

# Создание категорий
categories = Category.create!([
                                { title: 'Programming' },
                                { title: 'Math' },
                                { title: 'Science' }
                              ])

# Создание тестов
tests = Test.create!([
                       { title: 'Ruby Basics', level: 0, category_id: categories[0].id  },
                       { title: 'Advanced Math', level: 1, category_id: categories[1].id  },
                       { title: 'Physics 101', level: 0, category_id: categories[2].id  }
                     ])

# Создание вопросов
questions = Question.create!([
                               { body: 'What is Ruby?', test_id: tests[0].id  },
                               { body: 'Solve the equation x^2 + 3x + 2 = 0', test_id: tests[1].id  },
                               { body: 'What is the speed of light?', test_id: tests[2].id  }
                             ])

# Создание ответов
answers = Answer.create!([
                 { body: 'A programming language', correct: true, question_id: questions[0].id  },
                 { body: 'A type of gemstone', correct: false, question_id: questions[0].id  },
                 { body: 'x = -1, -2', correct: true, question_id: questions[1].id  },
                 { body: 'x = 1, 2', correct: false, question_id: questions[1].id  },
                 { body: '299,792,458 m/s', correct: true, question_id: questions[2].id  },
                 { body: '300,000,000 m/s', correct: false, question_id: questions[2].id  }
               ])