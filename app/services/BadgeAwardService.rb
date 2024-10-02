class BadgeAwardService
  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
    @badges = []
  end

  def call
    Badge.all.each do |badge|
      @badges << badge if send("check_#{badge.rule_type}?", badge)
    end
    @user.badges << @badges if @badges.present?
  end

  private

  # Проверка на выполнение правила "Прохождение всех тестов из категории"
  def check_category_complete?(badge)
    category = Category.find_by(title: badge.rule_value)
    return false unless category

    tests_in_category = category.tests.ids
    passed_tests_in_category = @user.test_passages
                                    .where(test_id: tests_in_category, success: true)
                                    .pluck(:test_id)
                                    .uniq

    tests_in_category.sort == passed_tests_in_category.sort
  end

  # Проверка на правило "Прохождение теста с первой попытки"
  def check_first_attempt?(badge)
    @user.test_passages.where(test_id: @test_passage.test_id).count == 1 && @test_passage.success?
  end

  # Проверка на выполнение правила "Прохождение всех тестов определённого уровня"
  def check_level_complete?(badge)
    level = badge.rule_value.to_i
    tests_of_level = Test.where(level: level).ids
    passed_tests_of_level = @user.test_passages
                                 .where(test_id: tests_of_level, success: true)
                                 .pluck(:test_id)
                                 .uniq

    tests_of_level.sort == passed_tests_of_level.sort
  end
end


