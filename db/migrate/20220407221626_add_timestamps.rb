class AddTimestamps < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :created_at, :datetime
  end
end
