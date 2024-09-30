Category.delete_all
Test.delete_all
Question.delete_all
Answer.delete_all

# Создание пользователей
# users = User.create!([
#                        { name: 'Alice', email: 'alice@example.com' },
#                        { name: 'Bob', email: 'bob@example.com' },
#                        { name: 'Charlie', email: 'charlie@example.com' }
#                      ])
user = User.first

# Создание категорий
categories = Category.create([
                                { title: 'Programming' },
                                { title: 'Math' },
                                { title: 'Science' },
                                { title: 'History' },
                                { title: 'Geography' }
                              ])

# Создание тестов
tests = Test.create!([
                       { title: 'Ruby Basics', level: 1, category_id: categories[0].id, author_id: user.id },
                       { title: 'Advanced Math', level: 2, category_id: categories[1].id, author_id: user.id  },
                       { title: 'Physics 101', level: 1, category_id: categories[2].id, author_id: user.id  },
                       { title: 'World History', level: 3, category_id: categories[3].id, author_id: user.id },
                       { title: 'Geography of Europe', level: 2, category_id: categories[4].id, author_id: user.id  },
                       { title: 'Algorithms and Data Structures', level: 3, category_id: categories[0].id, author_id: user.id  },
                       { title: 'Linear Algebra', level: 2, category_id: categories[1].id, author_id: user.id },
                       { title: 'Quantum Physics', level: 3, category_id: categories[2].id, author_id: user.id  }
                     ])

# Создание вопросов
questions = Question.create([
                               { body: 'What is Ruby?', test_id: tests[0].id },
                               { body: 'What is a Ruby Gem?', test_id: tests[0].id },
                               { body: 'What is the difference between a class and a module in Ruby?', test_id: tests[0].id },
                               { body: 'Solve the equation x^2 + 3x + 2 = 0', test_id: tests[1].id },
                               { body: 'What is a derivative?', test_id: tests[1].id },
                               { body: 'What is the speed of light?', test_id: tests[2].id },
                               { body: 'What is Newton\'s First Law?', test_id: tests[2].id },
                               { body: 'What is the gravitational constant?', test_id: tests[2].id },
                               { body: 'Who was the first president of the USA?', test_id: tests[3].id },
                               { body: 'What event started World War I?', test_id: tests[3].id },
                               { body: 'Name the capital of Germany.', test_id: tests[4].id },
                               { body: 'What is the longest river in Europe?', test_id: tests[4].id },
                               { body: 'What is Big O notation?', test_id: tests[5].id },
                               { body: 'Explain the concept of recursion.', test_id: tests[5].id },
                               { body: 'Solve the matrix equation A*X=B', test_id: tests[6].id },
                               { body: 'What is an eigenvalue?', test_id: tests[6].id },
                               { body: 'What is quantum entanglement?', test_id: tests[7].id },
                               { body: 'What is Heisenberg\'s Uncertainty Principle?', test_id: tests[7].id }
                             ])

# Создание ответов
answers = Answer.create([
                           { body: 'A programming language', correct: true, question_id: questions[0].id },
                           { body: 'A type of gemstone', correct: false, question_id: questions[0].id },
                           { body: 'A package manager for Ruby libraries', correct: true, question_id: questions[1].id },
                           { body: 'A Ruby interpreter', correct: false, question_id: questions[1].id },
                           { body: 'A class can be instantiated, while a module cannot', correct: true, question_id: questions[2].id },
                           { body: 'A module is a type of class', correct: false, question_id: questions[2].id },
                           { body: 'x = -1, -2', correct: true, question_id: questions[3].id },
                           { body: 'x = 1, 2', correct: false, question_id: questions[3].id },
                           { body: 'A measure of how a function changes', correct: true, question_id: questions[4].id },
                           { body: 'An integral', correct: false, question_id: questions[4].id },
                           { body: '299,792,458 m/s', correct: true, question_id: questions[5].id },
                           { body: '300,000,000 m/s', correct: false, question_id: questions[5].id },
                           { body: 'An object remains at rest or in uniform motion unless acted upon by a force', correct: true, question_id: questions[6].id },
                           { body: 'An object in motion stays in motion', correct: false, question_id: questions[6].id },
                           { body: '6.67430 × 10^-11 m^3 kg^-1 s^-2', correct: true, question_id: questions[7].id },
                           { body: '9.81 m/s²', correct: false, question_id: questions[7].id },
                           { body: 'George Washington', correct: true, question_id: questions[8].id },
                           { body: 'Abraham Lincoln', correct: false, question_id: questions[8].id },
                           { body: 'The assassination of Archduke Franz Ferdinand', correct: true, question_id: questions[9].id },
                           { body: 'The sinking of the Lusitania', correct: false, question_id: questions[9].id },
                           { body: 'Berlin', correct: true, question_id: questions[10].id },
                           { body: 'Munich', correct: false, question_id: questions[10].id },
                           { body: 'The Volga River', correct: true, question_id: questions[11].id },
                           { body: 'The Danube River', correct: false, question_id: questions[11].id },
                           { body: 'A measure of algorithm efficiency', correct: true, question_id: questions[12].id },
                           { body: 'A type of data structure', correct: false, question_id: questions[12].id },
                           { body: 'A function that calls itself', correct: true, question_id: questions[13].id },
                           { body: 'A loop that iterates over a list', correct: false, question_id: questions[13].id },
                           { body: 'Use matrix inversion', correct: true, question_id: questions[14].id },
                           { body: 'Solve using determinants', correct: false, question_id: questions[14].id },
                           { body: 'A value that characterizes a matrix', correct: true, question_id: questions[15].id },
                           { body: 'A value that minimizes a function', correct: false, question_id: questions[15].id },
                           { body: 'A phenomenon where particles remain connected', correct: true, question_id: questions[16].id },
                           { body: 'A principle of relativity', correct: false, question_id: questions[16].id },
                           { body: 'The more precisely the position of a particle is known, the less precisely its momentum can be known', correct: true, question_id: questions[17].id },
                           { body: 'A law of thermodynamics', correct: false, question_id: questions[17].id }
                         ])

# # Создание прохождений тестов
# TestPassage.create!([
#                       { user_id: users[0].id , test_id: tests[0].id , current_question_id: questions[0].id , correct_questions: 1 },
#                       { user_id: users[1].id , test_id: tests[1].id , current_question_id: questions[1].id , correct_questions: 2 },
#                       { user_id: users[2].id , test_id: tests[2].id , current_question_id: questions[2].id , correct_questions: 3 }
#                     ])