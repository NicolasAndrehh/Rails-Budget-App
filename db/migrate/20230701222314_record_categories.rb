class RecordCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :record_categories do |t|
      t.integer :record_id
      t.integer :category_id

      t.timestamps
    end

    add_foreign_key :record_categories, :records, column: :record_id
    add_foreign_key :record_categories, :categories, column: :category_id

    add_index :record_categories, :record_id
    add_index :record_categories, :category_id
  end
end
