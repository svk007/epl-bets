class AddWinnerToBets < ActiveRecord::Migration
  def change
    add_column :bets, :winner, :string, default: "TBD"
  end
end
