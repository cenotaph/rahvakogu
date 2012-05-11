class AddAllocatedUserPoints < ActiveRecord::Migration
  def self.up
    add_column :ideas, :cached_allocated_points_counter, :integer, :default=>0
    add_column :ideas, :block_emails_from_voting, :string

    create_table :allocated_user_points do |t|
      t.integer :user_id, :null=>false
      t.integer :idea_id, :null=>false
      t.integer :allocated_points, :null=>false
      t.timestamps
    end

    add_index :allocated_user_points, :user_id
    add_index :allocated_user_points, :idea_id
  end

  def self.down
  end
end
