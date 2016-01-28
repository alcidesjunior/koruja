class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :subjects, index: true
      t.references :grades, index: true
      t.references :grades, index: true
      t.timestamps null: false
    end
  end
end
