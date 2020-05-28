class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.timestamp :active_at
      t.timestamp :inactive_at

      t.timestamps
    end
  end
end
