class AddChangesetsBranches < ActiveRecord::Migration
  def self.up
    add_column :changesets, :branches, :string, :limit => nil, :default => nil
  end
  
  def self.down
    remove_column :changesets, :branches
  end
end