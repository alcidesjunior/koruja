class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.belongs_to :student, index: true
      t.timestamps null: false
    end
  end
end
