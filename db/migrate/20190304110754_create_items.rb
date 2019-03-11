class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :category
      t.string :title
      t.integer :priority
      t.boolean :completed
      t.date :completed_on

      t.timestamps
    end
  end
end
