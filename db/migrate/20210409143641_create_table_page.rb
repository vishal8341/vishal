class CreateTablePage < ActiveRecord::Migration
  def change
    create_table :table_pages do |t|
        t.string :title
        t.text :description
        t.timestamps null: false
    end
  end
end
