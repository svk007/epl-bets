class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
			t.references :match
			t.references :user
			t.integer :amount
			t.string :team_name
      t.timestamps null: false
    end
    add_index :bets, ["match_id", "user_id"]
  end
end
