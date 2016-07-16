class CreateMatches < ActiveRecord::Migration
	def change
		create_table :matches do |t|
			t.string :hometeam
			t.string :awayteam
			t.timestamps null: false
		end
	end
end
