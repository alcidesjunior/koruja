class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.belongs_to :student, index: true
      t.timestamps null: false
    end
  end
end
