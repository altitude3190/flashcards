class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :language_id, :null => false
      t.integer :category_id, :null => false
      t.text :word, :null => false
      t.text :meaning, :null => false
      t.text :ruby
    end
    add_index :words, [:language_id, :category_id]
  end
end
