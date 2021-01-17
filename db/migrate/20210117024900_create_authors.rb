class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :birth_year
      t.references :books, null: false, foreign_key: true

      t.timestamps
    end
  end
end
