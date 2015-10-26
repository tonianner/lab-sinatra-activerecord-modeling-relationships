class CreateRecipeTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :servings

      t.timestamps
    end
  end
end
