class AddDefaultSuccessToTestPassages < ActiveRecord::Migration[6.1]
  def change
    def change
      change_column_default :test_passages, :success, from: nil, to: false
    end
  end
end
