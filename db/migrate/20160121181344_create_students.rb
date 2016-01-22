class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :subjects, index: true, foreign_key: true
      t.references :grades, index: true, foreign_key: true
      t.references :grades, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
