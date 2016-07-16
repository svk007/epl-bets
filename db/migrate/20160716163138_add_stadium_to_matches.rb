class AddStadiumToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :stadium, :string
    add_column :matches, :matchtime, :datetime
  end
end
