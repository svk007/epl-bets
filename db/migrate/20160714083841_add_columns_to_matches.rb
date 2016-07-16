class AddColumnsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :homeodds, :decimal
    add_column :matches, :awayodds, :decimal
    add_column :matches, :drawodds, :decimal
  end
end
