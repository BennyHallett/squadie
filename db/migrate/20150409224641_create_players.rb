class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string  :name
      t.string  :position
      t.date    :dob
      t.integer :goals
      t.integer :assists
      t.integer :red_cards
      t.integer :yellow_cards
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
