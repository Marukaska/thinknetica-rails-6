class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_filename, null: false
      t.string :rule_type, null: false
      t.string :rule_value

      t.timestamps
    end
  end
end
