class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.integer :drinks
      t.text :log
    end
  end
end
