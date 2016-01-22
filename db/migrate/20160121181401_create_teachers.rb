class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.belongs_to :student, index: true
      t.timestamps null: false
    end
  end
end
