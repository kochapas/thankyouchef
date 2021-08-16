class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :cuisine_type
      t.Integer :duration
      t.Integer :price
      t.references :chef_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
